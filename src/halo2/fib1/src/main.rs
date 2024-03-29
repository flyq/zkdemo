use std::marker::PhantomData;

use halo2_proofs::arithmetic::Field;
use halo2_proofs::circuit::{AssignedCell, Layouter, SimpleFloorPlanner, Value};
use halo2_proofs::dev::MockProver;
use halo2_proofs::plonk::{Advice, Circuit, Column, ConstraintSystem, Error, Selector};
use halo2_proofs::poly::Rotation;
use halo2curves::pasta::Fp;

#[derive(Debug, Clone)]
struct Number<F: Field>(AssignedCell<F, F>);

#[derive(Debug, Clone)]
struct FiboConfig {
    pub advice: [Column<Advice>; 3],
    pub selector: Selector,
}

struct FiboChip<F: Field> {
    config: FiboConfig,
    _marker: PhantomData<F>,
}

impl<F: Field> FiboChip<F> {
    // This method is the constructor for the chip!
    fn construct(config: FiboConfig) -> Self {
        Self {
            config,
            _marker: PhantomData,
        }
    }

    // This method is where we define the Config of the chip by creating colums
    // and defining custom gates
    fn configure(meta: &mut ConstraintSystem<F>) -> FiboConfig {
        // create the 3 advice colums
        let col_a: Column<Advice> = meta.advice_column();
        let col_b: Column<Advice> = meta.advice_column();
        let col_c: Column<Advice> = meta.advice_column();
        // create the selector
        let selector: Selector = meta.selector();

        // In order to perform the permutation check later on we need to enable equality
        // By enabling equality, we tell the halo2 compiler that these columns are gonna be used inside the permutation check.
        // If we don't enable it, we won't be able to perform the permutation check.
        meta.enable_equality(col_a);
        meta.enable_equality(col_b);
        meta.enable_equality(col_c);

        // create custom gate. This is the first constraint (of custom gate type) described in fibonacci-constraint-1.png
        meta.create_gate("add", |meta| {
            // col_a | col_b | col_c | selector
            // ---------------------------------
            //  a    |   b   |   c   |   s
            // We are now querying 4 cells from a single row. The selector has no rotation as it is like coordinating the whole thing.
            // For the advice colums, we are querying the current row as the rotation is set to cur.
            // What you are querying in the advice columns is relative to the selector. If the selector is turned on
            // then the advice column's cells are enabled to be used. If we turn the selector on, the advice columns will be used for this row
            // If we use the rotation next for column c we'll be querying the value inside the instance column for the next row.
            // In this way we can define a different shape for our custom gate.
            // col_a | col_b | col_c | selector
            // ---------------------------------
            //  a    |   b   |       |   s
            //       |       |   c   |
            // Query returns you a cell from a column to be used inside the custom gate j
            let s = meta.query_selector(selector);
            let a = meta.query_advice(col_a, Rotation::cur());
            let b = meta.query_advice(col_b, Rotation::cur());
            let c = meta.query_advice(col_c, Rotation::cur());

            // return the contraint(s) inside our custom gate. You can define as many
            // constraints as you want inside the same custom gate
            // If selector is turned off, the constraint will be satisfied whatever value is assigned to a,b,c
            vec![s * (a + b - c)] // s * (a + b - c) = 0
        });

        // return the configuration of the circuit. This included the advice columns and the selector, while the custom gates have been mutated on `meta`.
        FiboConfig {
            advice: [col_a, col_b, col_c],
            selector,
        }
    }

    // This is the function used inside syntentize to assign value to the first raw of the circuit.
    // mut layouter: impl Layouter<F> specifies a function parameter named layouter, which is mutable (mut keyword), and implements the Layouter<F> trait.
    // a and b value will be provided to this function as input. This are the a and b to be assigned inside the first row.
    fn assign_first_row(
        &self,
        mut layouter: impl Layouter<F>,
        a: Option<F>,
        b: Option<F>,
    ) -> Result<(Number<F>, Number<F>, Number<F>), Error> {
        layouter.assign_region(
            || "first row",
            |mut region| {
                // We need to enable the selector in that region because the constraint is set!
                self.config.selector.enable(&mut region, 0)?;

                // Assign the value to a and b. It returns an assigned cell!
                let a_cell = region
                    .assign_advice(|| "a", self.config.advice[0], 0, || to_value(a))
                    .map(Number)?;

                let b_cell = region
                    .assign_advice(|| "b", self.config.advice[1], 0, || to_value(b))
                    .map(Number)?;

                // Then we compute the value c and later assign it to c_cell. C=a+b
                let c_val = a.and_then(|a| b.map(|b| a + b));

                let c_cell = region
                    .assign_advice(|| "c", self.config.advice[2], 0, || to_value(c_val))
                    .map(Number)?;

                Ok((a_cell, b_cell, c_cell))
            },
        )
    }

    // This function takes a layouter in and cells from the previous row and assign value for the current row.
    fn assign_row(
        &self,
        mut layouter: impl Layouter<F>,
        prev_b: &Number<F>,
        prev_c: &Number<F>,
    ) -> Result<Number<F>, Error> {
        // Create permutation check contraints. This is the first constraint (of permutation type) described in fibonacci-constraint-2.png
        layouter.assign_region(
            || "next row",
            |mut region| {
                // Here we turn on the selector gate
                self.config.selector.enable(&mut region, 0)?;
                // In this line I'm trying to copy stuff from the previous row to the new region in the current row
                // This is the copy constraint basically
                // I'm copying the prev_b to the current region in advice column 0 (aka "a")
                // Offset 0 means that I'm copying to the first row in the region
                prev_b
                    .0
                    .copy_advice(|| "a", &mut region, self.config.advice[0], 0)?;
                // I'm copying the prev_c to the current region in advice column 1 (aka "b")
                // Offset 0 means that I'm copying to the first row in the region
                prev_c
                    .0
                    .copy_advice(|| "b", &mut region, self.config.advice[1], 0)?;

                // Lastly, we access the values from prev_b and prev_c and add them together to get the c_val
                let c_val = prev_b
                    .0
                    .value()
                    .and_then(|b| prev_c.0.value().map(|c| *b + *c));

                // We create the c_cell for the current row by assign the c_val to it!
                let c_cell = region
                    .assign_advice(|| "c", self.config.advice[2], 0, || c_val)
                    .map(Number)?;

                Ok(c_cell)
            },
        )
    }
}

#[derive(Default)]
struct MyCircuit<F> {
    pub a: Option<F>,
    pub b: Option<F>,
}

impl<F: Field> Circuit<F> for MyCircuit<F> {
    type Config = FiboConfig;
    type FloorPlanner = SimpleFloorPlanner;

    // It generates an empty circuit without any witness
    // You can use this api to generate proving key or verification key without any witness
    fn without_witnesses(&self) -> Self {
        Self::default()
    }

    // create configuration for the Circuit
    fn configure(meta: &mut ConstraintSystem<F>) -> Self::Config {
        FiboChip::configure(meta)
    }

    // API to be called after the constraint system is defined.
    // Assign the values inside the actual prover input inside the circuit.
    // mut layouter: impl Layouter<F> specifies a function parameter named layouter, which is mutable (mut keyword), and implements the Layouter<F> trait.
    fn synthesize(
        &self,
        config: Self::Config,
        mut layouter: impl Layouter<F>,
    ) -> Result<(), Error> {
        // We create a new instance of chip using the config passed as input
        let chip = FiboChip::construct(config);
        // now we assign stuff inside the circuit!
        // first row is particular so we create a specific function for that.
        // This function will take as input the "a" and "b" value passed to instantiate the circuit
        // We also use a layouter as this is a good way to separate different regions of the circuit
        // We can also assign name to the layouter
        let (_, mut prev_b, mut prev_c) =
            chip.assign_first_row(layouter.namespace(|| "first row"), self.a, self.b)?;

        // Now we have assigned the first row! Now we have to assign the other rows! Remember that the idea of the circuit was
        // given f(0) = x, f(1) = y, we will prove f(9) = z. We already have assigned f(0) and f(1). We now need to assign values to the other rows.
        for _i in 3..10 {
            let c_cell = chip.assign_row(layouter.namespace(|| "next row"), &prev_b, &prev_c)?;

            prev_b = prev_c;
            prev_c = c_cell;
        }

        Ok(())
    }
}

fn to_value<T>(v: Option<T>) -> Value<T> {
    match v {
        None => Value::unknown(),
        Some(val) => Value::known(val),
    }
}

fn main() {
    let k = 4;
    let a = Fp::from(1);
    let b = Fp::from(1);

    let circuit = MyCircuit {
        a: Some(a),
        b: Some(b),
    };

    // The mock prover is a function that execute the configuration of the circuit by running its method configure
    // and also execute the syntetize function, by passing in the actual input.
    // The instance vector is empty as we don't have any public input to pass to the function
    let prover = MockProver::run(k, &circuit, vec![]).unwrap();

    prover.assert_satisfied();
}
