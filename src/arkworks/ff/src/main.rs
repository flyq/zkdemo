use ark_ff::{BigInteger, Field, PrimeField};
// We'll use a field associated with the BLS12-381 pairing-friendly
// group for this example.
use ark_bls12_381::Fq as F;
// `ark-std` is a utility crate that enables `arkworks` libraries
// to easily support `std` and `no_std` workloads, and also re-exports
// useful crates that should be common across the entire ecosystem, such as `rand`.
use ark_std::{One, UniformRand, Zero};

fn main() {
    // ---------------- Field ----------------
    let mut rng = ark_std::test_rng();
    // Let's sample uniformly random field elements:
    let a = F::rand(&mut rng);
    let b = F::rand(&mut rng);

    // We can add...
    let c = a + b;
    // ... subtract ...
    let d = a - b;
    // ... double elements ...
    assert_eq!(c + d, a.double());

    // ... multiply ...
    let e = c * d;
    // ... square elements ...
    assert_eq!(e, a.square() - b.square());

    // ... and compute inverses ...
    assert_eq!(a.inverse().unwrap() * a, F::one()); // have to to unwrap, as `a` could be zero.

    // We can check if a field element is a square by computing its Legendre symbol...
    if a.legendre().is_qr() {
        // ... and if it is, we can compute its square root.
        let b = a.sqrt().unwrap();
        assert_eq!(b.square(), a);
    } else {
        // Otherwise, we can check that the square root is `None`.
        assert_eq!(a.sqrt(), None);
    }

    // ---------------- PrimeField ----------------
    // We can access the prime modulus associated with `F`:
    let a = F::rand(&mut rng);
    let modulus = <F as PrimeField>::MODULUS;
    assert_eq!(a.pow(&modulus), a);

    // We can convert field elements to integers in the range [0, MODULUS - 1]:
    let one: num_bigint::BigUint = F::one().into();
    assert_eq!(one, num_bigint::BigUint::one());

    // We can construct field elements from an arbitrary sequence of bytes:
    let n = F::from_le_bytes_mod_order(&modulus.to_bytes_le());
    assert_eq!(n, F::zero());
}
