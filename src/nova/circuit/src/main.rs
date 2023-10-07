use bellpepper_core::ConstraintSystem;
use ff::Field;
use nova_analysis::bellpepper::r1cs::{NovaShape, NovaWitness};
use nova_analysis::bellpepper::solver::SatisfyingAssignment;
use nova_analysis::bellpepper::test_shape_cs::TestShapeCS;
use nova_analysis::circuit::{
    NovaAugmentedCircuit, NovaAugmentedCircuitInputs, NovaAugmentedCircuitParams,
};
use nova_analysis::constants::{BN_LIMB_WIDTH, BN_N_LIMBS};
use nova_analysis::gadgets::utils::scalar_as_base;
use nova_analysis::provider::poseidon::PoseidonConstantsCircuit;
use nova_analysis::traits::circuit::TrivialTestCircuit;
use nova_analysis::traits::{Group, ROConstantsCircuit};

type PastaG1 = pasta_curves::pallas::Point;
type PastaG2 = pasta_curves::vesta::Point;

fn main() {
    let params1 = NovaAugmentedCircuitParams::new(BN_LIMB_WIDTH, BN_N_LIMBS, true);
    let params2 = NovaAugmentedCircuitParams::new(BN_LIMB_WIDTH, BN_N_LIMBS, false);
    let ro_consts1: ROConstantsCircuit<PastaG2> = PoseidonConstantsCircuit::default();
    let ro_consts2: ROConstantsCircuit<PastaG1> = PoseidonConstantsCircuit::default();

    test_recursive_circuit_with::<PastaG1, PastaG2>(
        &params1, &params2, ro_consts1, ro_consts2, 9815, 10347,
    );
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
        NovaAugmentedCircuit::new(primary_params, None, &ttc1, ro_consts1.clone());
    let mut cs = TestShapeCS::<G1>::new();
    let _ = circuit1.synthesize(&mut cs);

    let (shape1, ck1) = cs.r1cs_shape();
    assert_eq!(cs.num_constraints(), num_constraints_primary);

    let ttc2 = TrivialTestCircuit::default();
    let circuit2: NovaAugmentedCircuit<'_, G1, TrivialTestCircuit<<G1 as Group>::Base>> =
        NovaAugmentedCircuit::new(secondary_params, None, &ttc2, ro_consts2.clone());
    let mut cs: TestShapeCS<G2> = TestShapeCS::new();
    let _ = circuit2.synthesize(&mut cs);
    let (shape2, ck2) = cs.r1cs_shape();
    assert_eq!(cs.num_constraints(), num_constraints_secondary);

    let zero1 = <<G2 as Group>::Base as Field>::ZERO;
    let mut cs1 = SatisfyingAssignment::<G1>::new();
    let inputs1 = NovaAugmentedCircuitInputs::<G2>::new(
        scalar_as_base::<G1>(zero1),
        zero1,
        vec![zero1],
        None,
        None,
        None,
        None,
    );
    let circuit1: NovaAugmentedCircuit<'_, G2, TrivialTestCircuit<<G2 as Group>::Base>> =
        NovaAugmentedCircuit::new(primary_params, Some(inputs1), &ttc1, ro_consts1);
    let _ = circuit1.synthesize(&mut cs1);
    let (inst1, witness1) = cs1.r1cs_instance_and_witness(&shape1, &ck1).unwrap();
    // Make sure that this is satisfiable
    assert!(shape1.is_sat(&ck1, &inst1, &witness1).is_ok());

    let zero2 = <<G1 as Group>::Base as Field>::ZERO;
    let mut cs2: SatisfyingAssignment<G2> = SatisfyingAssignment::new();
    let inputs2: NovaAugmentedCircuitInputs<G1> = NovaAugmentedCircuitInputs::new(
        scalar_as_base::<G2>(zero2), // pass zero for testing
        zero2,
        vec![zero2],
        None,
        None,
        Some(inst1),
        None,
    );

    let circuit2: NovaAugmentedCircuit<'_, G1, TrivialTestCircuit<<G1 as Group>::Base>> =
        NovaAugmentedCircuit::new(secondary_params, Some(inputs2), &ttc2, ro_consts2);
    let _ = circuit2.synthesize(&mut cs2);
    let (inst2, witness2) = cs2.r1cs_instance_and_witness(&shape2, &ck2).unwrap();
    // Make sure that it is satisfiable
    assert!(shape2.is_sat(&ck2, &inst2, &witness2).is_ok());
}
