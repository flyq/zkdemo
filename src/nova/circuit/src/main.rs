use nova_analysis::bellpepper::r1cs::NovaShape;
use nova_analysis::bellpepper::test_shape_cs::TestShapeCS;
use nova_analysis::circuit::{NovaAugmentedCircuit, NovaAugmentedCircuitParams};
use nova_analysis::traits::circuit::TrivialTestCircuit;
use nova_analysis::traits::{Group, ROConstantsCircuit};

fn main() {
    println!("Hello, world!");
}

fn test_recursive_circuit_with<G1, G2>(
    primary_params: &NovaAugmentedCircuitParams,
    secondary_params: &NovaAugmentedCircuitParams,
    ro_consts1: ROConstantsCircuit<G2>,
    ro_consts2: ROConstantsCircuit<G1>,
    num_constraints_primary: usize,
    num_constraints_secondary: usize,
) where
    G1: Group<Base = <G2 as Group>::Scalar>,
    G2: Group<Base = <G1 as Group>::Scalar>,
{
    let ttc1 = TrivialTestCircuit::<<G2 as Group>::Base>::default();

    let circuit1: NovaAugmentedCircuit<'_, G2, TrivialTestCircuit<<G2 as Group>::Base>> =
        NovaAugmentedCircuit::new(primary_params, None, &ttc1, ro_consts1);
    let mut cs = TestShapeCS::<G1>::new();
    let _ = circuit1.synthesize(&mut cs);

    let (shape1, ck1) = cs.r1cs_shape();
    assert_eq!(cs.num_constraints(), num_constraints_primary);
}
