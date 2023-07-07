use ark_bls12_381::{
    Bls12_381, Fr as ScalarField, G1Affine, G1Projective as G1, G2Projective as G2,
};
use ark_ec::pairing::Pairing;
use ark_ec::{AffineRepr, CurveGroup, Group, VariableBaseMSM};
use ark_ff::Field;
use ark_std::{ops::Mul, UniformRand, Zero};

fn main() {
    // ---------------- Group trait ----------------
    let mut rng = ark_std::test_rng();
    // Let's sample uniformly random group elements:
    let a = G1::rand(&mut rng);
    let b = G1::rand(&mut rng);

    // Group add
    let c = a + b;
    // sub
    let d = a - b;
    // add
    assert_eq!(c + d, a.double());
    // negate
    let e = -a;
    assert_eq!(e + a, G1::zero());

    // scalar mul
    let scalar = ScalarField::rand(&mut rng);
    let e = c.mul(scalar);
    // in ark_ff:: FpConfig::inverse:  Compute a^{-1} if `a` is not zero.
    let f = e.mul(scalar.inverse().unwrap());
    assert_eq!(f, c);

    // ---------------- scalar multiplication ----------------
    // Let's sample uniformly random group elements:
    let a = G1Affine::rand(&mut rng);
    let b = G1Affine::rand(&mut rng);

    let s1 = ScalarField::rand(&mut rng);
    let s2 = ScalarField::rand(&mut rng);

    // Note that we're using the `G1Affine` type here, as opposed to `G`.
    // This is because MSMs are more efficient when the group elements are in affine form. (See below for why.)
    //
    // The `VariableBaseMSM` trait allows specializing the input group element representation to allow
    // for more efficient implementations.
    let r = G1::msm(&[a, b], &[s1, s2]).unwrap();
    assert_eq!(r, a * s1 + b * s2);

    // ---------------- Elliptic curve groups ----------------
    // Let's generate an elliptic curve group element in the `CurveGroup` representation
    let a = G1::rand(&mut rng);
    // We can convert it the `AffineRepr` representation...
    let a_aff = a.into_affine();

    // two representations are equal.
    assert_eq!(a_aff, a);
    // We can also convert back to the `CurveGroup` representation:
    assert_eq!(a, a_aff.into_group());

    // Point + Affine, more efficient
    let d = a + a_aff;
    assert_eq!(d, a.double());

    // This efficiency also translates into more efficient scalar multiplication routines.
    let scalar = ScalarField::rand(&mut rng);
    let mul_result = a_aff * scalar;
    assert_eq!(a * scalar, mul_result);

    // construct group elements from the x and y coordinates of the curve points.
    // This is useful when implementing algorithms like hash-to-curve.
    let a_x = a_aff.x;
    let a_y = a_aff.y;
    let is_at_infinity = a_aff.is_zero();
    assert!(!is_at_infinity);

    // This check ensures that `new_a` is indeed in the curve group
    let new_a = G1Affine::new(a_x, a_y);
    assert_eq!(a_aff, new_a);
    assert!(new_a.is_on_curve());
    // and in particular is within the prime-order group.
    assert!(new_a.is_in_correct_subgroup_assuming_on_curve());

    // ---------------- Elliptic curve groups ----------------
    // The pairing engine is parameterized by the scalar field of the curve.
    let a = G1::rand(&mut rng);
    let b = G2::rand(&mut rng);

    // We can compute the pairing of two points on the curve, either monolithically...
    let e1 = Bls12_381::pairing(a, b);
    // ... or in two steps. First, we compute the Miller loop...
    let ml_result = Bls12_381::miller_loop(a, b);
    // ... and then the final exponentiation.
    let e2 = Bls12_381::final_exponentiation(ml_result).unwrap();
    assert_eq!(e1, e2);
}
