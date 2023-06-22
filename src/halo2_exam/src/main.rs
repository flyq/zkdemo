// use std::marker::PhantomData;

use std::marker::PhantomData;

use group::ff::Field;
use halo2_proofs::circuit::{AssignedCell, Chip, Layouter, Region, SimpleFloorPlanner, Value};
use halo2_proofs::plonk::{Advice, Circuit, Column, ConstraintSystem, Error, Instance, Selector};
use halo2_proofs::poly::Rotation;

#[derive(Clone, Debug)]
struct MyConfig {
    advice: [Column<Advice>; 2],
    instance: Column<Instance>,
    s_mul: Selector,
}

struct MyChip<F: Field> {
    config: MyConfig,
    _marker: PhantomData<F>,
}

impl<F: Field> Chip<F> for MyChip<F> {
    type Config = MyConfig;
    type Loaded = ();

    fn config(&self) -> &Self::Config {
        &self.config
    }

    fn loaded(&self) -> &Self::Loaded {
        &()
    }
}

#[derive(Clone)]
struct Number<F: Field>(AssignedCell<F, F>);

impl<F: Field> MyChip<F> {
    fn load_private(
        &self,
        mut layouter: impl Layouter<F>,
        value: Value<F>,
    ) -> Result<Number<F>, Error> {
        layouter.assign_region(
            || "load private",
            |mut region| {
                region
                    .assign_advice(|| "private input", self.config.advice[0], 0, || value)
                    .map(Number)
            },
        )
    }

    fn load_constant(
        &self,
        mut layouter: impl Layouter<F>,
        constant: F,
    ) -> Result<Number<F>, Error> {
        layouter.assign_region(
            || "load constant",
            |mut region| {
                region
                    .assign_advice_from_constant(
                        || "constant value",
                        self.config.advice[0],
                        0,
                        constant,
                    )
                    .map(Number)
            },
        )
    }

    fn mul(
        &self,
        mut layouter: impl Layouter<F>,
        a: Number<F>,
        b: Number<F>,
    ) -> Result<Number<F>, Error> {
        layouter.assign_region(
            || "mul",
            |mut region: Region<'_, F>| {
                // We only want to use a single multiplication gate in this region,
                // so we enable it at region offset 0; this means it will constrain
                // cells at offsets 0 and 1.
                self.config.s_mul.enable(&mut region, 0)?;

                // The inputs we've been given could be located anywhere in the circuit,
                // but we can only rely on relative offsets inside this region. So we
                // assign new cells inside the region and constrain them to have the
                // same values as the inputs.
                a.0.copy_advice(|| "lhs", &mut region, self.config.advice[0], 0)?;
                b.0.copy_advice(|| "rhs", &mut region, self.config.advice[1], 0)?;

                // Now we can assign the multiplication result, which is to be assigned
                // into the output position.
                let value = a.0.value().copied() * b.0.value();

                // Finally, we do the assignment to the output, returning a
                // variable to be used in another part of the circuit.
                region
                    .assign_advice(|| "lhs * rhs", self.config.advice[0], 1, || value)
                    .map(Number)
            },
        )
    }
}

#[derive(Default, Debug)]
struct MyCircuit<F: Field> {
    constant: F,
    a: Value<F>,
    b: Value<F>,
}

impl<F: Field> Circuit<F> for MyCircuit<F> {
    type Config = MyConfig;
    type FloorPlanner = SimpleFloorPlanner;

    fn without_witnesses(&self) -> Self {
        Self::default()
    }

    fn configure(meta: &mut ConstraintSystem<F>) -> Self::Config {
        println!("ConstraintSystem 0: {:?}", meta);

        // 修改了 CS 的 num_advice_columns 为2
        // 修改了 CS 的 num_advice_queries 为 [0, 0]
        let advice = [meta.advice_column(), meta.advice_column()];
        println!("advice: {:?}", advice);
        println!("ConstraintSystem 1: {:?}", meta);

        // 修改了 CS 的 num_instance_columns 为 1
        let instance = meta.instance_column();
        println!("ConstraintSystem 2: {:?}", meta);

        // 修改了 CS 的 num_fixed_columns 为 1
        let constant = meta.fixed_column();
        println!("ConstraintSystem 3: {:?}", meta);

        println!("advice: {:?}", advice);
        println!("instance: {:?}", instance);
        println!("constant: {:?}", constant);

        meta.enable_equality(instance);
        meta.enable_constant(constant);
        for column in &advice {
            meta.enable_equality(*column);
        }
        let s_mul = meta.selector();

        meta.create_gate("mul", |meta| {
            let lhs = meta.query_advice(advice[0], Rotation::cur());
            let rhs = meta.query_advice(advice[1], Rotation::cur());
            let out = meta.query_advice(advice[0], Rotation::next());
            let s_mul = meta.query_selector(s_mul);

            vec![s_mul * (lhs * rhs - out)]
        });

        println!("ConstraintSystem 2: {:?}", meta);

        MyConfig {
            advice,
            instance,
            s_mul,
        }
    }

    fn synthesize(
        &self,
        config: Self::Config,
        mut layouter: impl Layouter<F>,
    ) -> Result<(), Error> {
        let my_chip = MyChip {
            config,
            _marker: PhantomData,
        };

        // Load our private values into the circuit.
        let a = my_chip.load_private(layouter.namespace(|| "load a"), self.a)?;
        let b = my_chip.load_private(layouter.namespace(|| "load b"), self.b)?;

        // Load the constant factor into the circuit.
        let constant =
            my_chip.load_constant(layouter.namespace(|| "load constant"), self.constant)?;

        // We only have access to plain multiplication.
        // We could implement our circuit as:
        //     asq  = a*a
        //     bsq  = b*b
        //     absq = asq*bsq
        //     c    = constant*asq*bsq
        //
        // but it's more efficient to implement it as:
        //     ab   = a*b
        //     absq = ab^2
        //     c    = constant*absq
        let ab = my_chip.mul(layouter.namespace(|| "a * b"), a, b)?;
        let absq = my_chip.mul(layouter.namespace(|| "ab * ab"), ab.clone(), ab)?;
        let c = my_chip.mul(layouter.namespace(|| "constant * absq"), constant, absq)?;

        // Expose the result as a public input to the circuit.

        layouter
            .namespace(|| "expose c")
            .constrain_instance(c.0.cell(), my_chip.config.instance, 0)
    }
}

fn main() {
    use halo2_proofs::{dev::MockProver, pasta::Fp};

    // ANCHOR: test-circuit
    // The number of rows in our circuit cannot exceed 2^k. Since our example
    // circuit is very small, we can pick a very small value here.
    let k = 4;

    // Prepare the private and public inputs to the circuit!
    let constant = Fp::from(7);
    let a = Fp::from(2);
    let b = Fp::from(3);
    let c = constant * a.square() * b.square();

    // Instantiate the circuit with the private inputs.
    let circuit = MyCircuit {
        constant,
        a: Value::known(a),
        b: Value::known(b),
    };

    println!("my circuit: {:?}", circuit);

    // Arrange the public input. We expose the multiplication result in row 0
    // of the instance column, so we position it there in our public inputs.
    let public_inputs = vec![c];

    // Given the correct public input, our circuit will verify.
    let prover = MockProver::run(k, &circuit, vec![public_inputs.clone()]).unwrap();

    println!("my prover: {:?}", prover);
    assert_eq!(prover.verify(), Ok(()));
}
