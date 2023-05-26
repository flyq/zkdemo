use ark_ff::{BigInteger, Field, FpConfig, PrimeField};
// We'll use a field associated with the BLS12-381 pairing-friendly
// group for this example.
use ark_bls12_381::fq2::Fq2 as F;
// `ark-std` is a utility crate that enables `arkworks` libraries
// to easily support `std` and `no_std` workloads, and also re-exports
// useful crates that should be common across the entire ecosystem, such as `rand`.
use ark_std::{One, UniformRand, Zero};

fn main() {
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

    if a.legendre().is_qr() {
        // ... and if it is, we can compute its square root.
        let b = a.sqrt().unwrap();
        assert_eq!(b.square(), a);
    } else {
        // Otherwise, we can check that the square root is `None`.
        assert_eq!(a.sqrt(), None);
    }

    // let modulus = <F as PrimeField>::MODULUS;
    // assert_eq!(a.pow(&modulus), a);
}
