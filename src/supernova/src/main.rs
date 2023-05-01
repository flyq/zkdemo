use ark_bls12_381::Fq;
use ark_crypto_primitives::sponge::poseidon::{find_poseidon_ark_and_mds, PoseidonConfig};
use ark_ff::{fields::PrimeField, One};
use ark_r1cs_std::{
    alloc::AllocVar,
    eq::EqGadget,
    fields::{fp::FpVar, FieldVar},
    R1CSVar,
};
use ark_relations::r1cs::ConstraintSystemRef;
use std::ops::{Add, Mul};
use std::thread;
use supernova::{create_generators, r1cs::R1CS, Proof};

fn main() {
    thread::spawn(|| {
        test_single_circuit_r1cs();
    });

    test_multi_circuit_r1cs();
}

fn cubic_circuit(cs: ConstraintSystemRef<Fq>, z: &[FpVar<Fq>]) -> Vec<FpVar<Fq>> {
    // Consider a cubic equation: `x^3 + x + 5 = y`, where `x` and `y` are respectively the
    // input and output.
    let x = FpVar::<_>::new_input(cs.clone(), || Ok(z[0].value().unwrap())).unwrap();
    let x_sq = x.square().unwrap();
    let x_cu = x_sq.mul(&x);
    let y = FpVar::<_>::new_witness(cs.clone(), || {
        Ok(x_cu.value().unwrap() + x.value().unwrap() + Fq::from(5u64))
    })
    .unwrap();
    x_cu.add(&x)
        .add(&FpVar::<_>::one())
        .add(&FpVar::<_>::one())
        .add(&FpVar::<_>::one())
        .add(&FpVar::<_>::one())
        .add(&FpVar::<_>::one())
        .enforce_equal(&y)
        .unwrap();

    vec![y]
}

fn test_single_circuit_r1cs() {
    // TODO: can we infer generator size
    let generators = create_generators(30000);
    let (ark, mds) = find_poseidon_ark_and_mds(Fq::MODULUS.const_num_bits() as u64, 2, 8, 43, 0);
    let constants = PoseidonConfig {
        full_rounds: 8,
        partial_rounds: 43,
        alpha: 5,
        ark,
        mds,
        rate: 2,
        capacity: 1,
    };
    let (folded, base) = R1CS::new(vec![Fq::one()], &cubic_circuit, &constants, &generators);

    let folded = [folded.clone(); 1];
    let mut proof = Proof::<R1CS, 1>::new(folded, base, generators);
    // Check base case verification.
    proof.verify().unwrap();

    // Fold and verify two steps of computation.
    for _ in 0..2 {
        proof.update(0, &cubic_circuit);
        proof.verify().unwrap();
    }
}

fn square_circuit(cs: ConstraintSystemRef<Fq>, z: &[FpVar<Fq>]) -> Vec<FpVar<Fq>> {
    // Consider a square equation: `x^2 + x + 5 = y`, where `x` and `y` are respectively the
    // input and output.
    let x = FpVar::<_>::new_input(cs.clone(), || Ok(z[0].value().unwrap())).unwrap();
    let x_sq = x.square().unwrap();
    let y = FpVar::<_>::new_witness(cs.clone(), || {
        Ok(x_sq.value().unwrap() + x.value().unwrap() + Fq::from(5u64))
    })
    .unwrap();
    x_sq.add(&x)
        .add(&FpVar::<_>::one())
        .add(&FpVar::<_>::one())
        .add(&FpVar::<_>::one())
        .add(&FpVar::<_>::one())
        .add(&FpVar::<_>::one())
        .enforce_equal(&y)
        .unwrap();

    vec![y]
}
fn test_multi_circuit_r1cs() {
    let generators = create_generators(30000);
    let (ark, mds) = find_poseidon_ark_and_mds(Fq::MODULUS.const_num_bits() as u64, 2, 8, 43, 0);
    let constants = PoseidonConfig {
        full_rounds: 8,
        partial_rounds: 43,
        alpha: 5,
        ark,
        mds,
        rate: 2,
        capacity: 1,
    };
    let (folded1, base) = R1CS::new(vec![Fq::one()], &cubic_circuit, &constants, &generators);
    let (folded2, _) = R1CS::new(vec![Fq::one()], &square_circuit, &constants, &generators);

    let folded: [R1CS; 2] = [folded1, folded2];
    let mut proof = Proof::<R1CS, 2>::new(folded, base, generators);
    // Check base case verification.
    proof.verify().unwrap();

    // Fold and verify two steps of computation for each circuit, in interlocked fashion.
    for _ in 0..2 {
        proof.update(0, &cubic_circuit);
        proof.verify().unwrap();
        proof.update(1, &square_circuit);
        proof.verify().unwrap();
    }
}
