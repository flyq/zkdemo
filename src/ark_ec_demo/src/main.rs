use ark_ec::{
    pairing::Pairing, short_weierstrass::Projective, AffineRepr, CurveGroup, Group, VariableBaseMSM,
};
use ark_ff::{Field, PrimeField};
// We'll use the BLS12-381 G1 curve for this example.
// This group has a prime order `r`, and is associated with a prime field `Fr`.
use ark_bls12_381::{
    Config, Fr as ScalarField, G1Affine as GAffine, G1Projective as G, G2Projective as G2,
};
use ark_std::{ops::Mul, UniformRand, Zero};

fn main() {
    let mut rng = ark_std::test_rng();
    // Let's sample uniformly random group elements:
    let a = G::rand(&mut rng);
    let a_aff = a.into_affine();
    assert_eq!(a_aff, a);

    assert_eq!(a, a_aff.into_group());

    let d = a + a_aff;
    assert_eq!(d, a.double());

    let b = G::rand(&mut rng);

    // We can add elements, ...
    let c = a + b;
    // ... subtract them, ...
    let d = a - b;
    // ... and double them.
    assert_eq!(c + d, a.double());
    // We can also negate elements, ...
    let e = -a;
    // ... and check that negation satisfies the basic group law
    assert_eq!(e + a, G::zero());

    // We can also multiply group elements by elements of the corresponding scalar field
    // (an act known as *scalar multiplication*)
    let scalar = ScalarField::rand(&mut rng);
    let e = c.mul(scalar);
    let f = e.mul(scalar.inverse().unwrap());
    assert_eq!(f, c);

    println!("{:?}", G::generator());

    let mut rng = ark_std::test_rng();
    // Let's sample uniformly random group elements:
    let a = GAffine::rand(&mut rng);
    let b = GAffine::rand(&mut rng);

    let s1 = ScalarField::rand(&mut rng);
    let s2 = ScalarField::rand(&mut rng);

    // Note that we're using the `GAffine` type here, as opposed to `G`.
    // This is because MSMs are more efficient when the group elements are in affine form. (See below for why.)
    //
    // The `VariableBaseMSM` trait allows specializing the input group element representation to allow
    // for more efficient implementations.
    let r = G::msm(&[a, b], &[s1, s2]).unwrap();
    assert_eq!(r, a * s1 + b * s2);

    let scalar = ScalarField::rand(&mut rng);
    let mul_result = a_aff * scalar;
    assert_eq!(a * scalar, mul_result);

    let a_x = a_aff.x;
    let a_y = a_aff.y;
    let is_at_infinity = a_aff.is_zero();

    let new_a = GAffine::new(a_x, a_y);
    assert_eq!(a_aff, new_a);
    assert!(new_a.is_on_curve());
    assert!(new_a.is_in_correct_subgroup_assuming_on_curve());

    // The pairing engine is parameterized by the scalar field of the curve.
    let mut rng = ark_std::test_rng();
    let s = ScalarField::rand(&mut rng);
    let a = G::rand(&mut rng);
    let b = G2::rand(&mut rng);

    // // We can compute the pairing of two points on the curve, either monolithically...
    // let e1: ark_ec::pairing::PairingOutput<Projective<Config>> = Pairing::pairing(a, b);
    // // ... or in two steps. First, we compute the Miller loop...
    // let ml_result = Pairing::miller_loop(a, b);
    // // ... and then the final exponentiation.
    // let e2 = Pairing::final_exponentiation(ml_result).unwrap();
    // assert_eq!(e1, e2);
}
