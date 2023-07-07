// We'll use the BLS12-381 pairing-friendly group for this example.
use ark_bls12_381::{G1Affine, G1Projective as G1, G2Affine, G2Projective as G2};
use ark_serialize::{
    CanonicalDeserialize, CanonicalSerialize, Compress, SerializationError, Valid, Validate,
};
use ark_std::io::{Read, Write};
use ark_std::UniformRand;

// #[derive(CanonicalSerialize, CanonicalDeserialize)]
pub struct MyStruct {
    a: G1Affine,
    b: G2Affine,
}

impl CanonicalSerialize for MyStruct {
    // We only have to implement the `serialize_with_mode` method; the other methods
    // have default implementations that call the latter.
    //
    // Notice that `serialize_with_mode` takes `mode: Compress` as an argument. This
    // is used to indicate whether we want to serialize with or without compression.
    fn serialize_with_mode<W: Write>(
        &self,
        mut writer: W,
        mode: Compress,
    ) -> Result<(), SerializationError> {
        self.a.serialize_with_mode(&mut writer, mode)?;
        self.b.serialize_with_mode(&mut writer, mode)?;
        Ok(())
    }

    fn serialized_size(&self, mode: Compress) -> usize {
        self.a.serialized_size(mode) + self.b.serialized_size(mode)
    }
}

impl CanonicalDeserialize for MyStruct {
    // We only have to implement the `deserialize_with_mode` method; the other methods
    // have default implementations that call the latter.
    fn deserialize_with_mode<R: Read>(
        mut reader: R,
        compress: Compress,
        validate: Validate,
    ) -> Result<Self, SerializationError> {
        let a = G1Affine::deserialize_with_mode(&mut reader, compress, validate)?;
        let b = G2Affine::deserialize_with_mode(&mut reader, compress, validate)?;
        Ok(Self { a, b })
    }
}

// We additionally have to implement the `Valid` trait for our struct.
// This trait specifies how to perform certain validation checks on deserialized types.
// For example, we can check that the deserialized group elements are in the prime-order subgroup.
impl Valid for MyStruct {
    fn check(&self) -> Result<(), SerializationError> {
        self.a.check()?;
        self.b.check()?;
        Ok(())
    }
}

fn main() {
    // ---------------- Example ----------------
    let mut rng = ark_std::test_rng();
    // Let's sample uniformly random group elements:
    let a: G1Affine = G1::rand(&mut rng).into();

    // We can serialize with compression...
    let mut compressed_bytes = Vec::new();
    a.serialize_compressed(&mut compressed_bytes).unwrap();
    // ...and without:
    let mut uncompressed_bytes = Vec::new();
    a.serialize_uncompressed(&mut uncompressed_bytes).unwrap();

    println!(
        "compressed_bytes: {:?}\nuncompressed_bytes: {:?}",
        compressed_bytes, uncompressed_bytes
    );

    // We can reconstruct our points from the compressed serialization...
    let a_compressed = G1Affine::deserialize_compressed(&*compressed_bytes).unwrap();

    // ... and from the uncompressed one:
    let a_uncompressed = G1Affine::deserialize_uncompressed(&*uncompressed_bytes).unwrap();

    assert_eq!(a_compressed, a);
    assert_eq!(a_uncompressed, a);

    // If we trust the origin of the serialization
    // (eg: if the serialization was stored on authenticated storage),
    // then we can skip some validation checks, which can greatly reduce deserialization time.
    let a_uncompressed_unchecked =
        G1Affine::deserialize_uncompressed_unchecked(&*uncompressed_bytes).unwrap();
    let a_compressed_unchecked =
        G1Affine::deserialize_compressed_unchecked(&*compressed_bytes).unwrap();
    assert_eq!(a_uncompressed_unchecked, a);
    assert_eq!(a_compressed_unchecked, a);

    // ---------------- customize Struct ----------------
    let b: G2Affine = G2::rand(&mut rng).into();
    let val = MyStruct { a, b };

    // We can serialize with compression...
    let mut compressed_bytes = Vec::new();
    val.serialize_compressed(&mut compressed_bytes).unwrap();
    // ...and without:
    let mut uncompressed_bytes = Vec::new();
    val.serialize_uncompressed(&mut uncompressed_bytes).unwrap();

    println!(
        "compressed_bytes: {:?}\nuncompressed_bytes: {:?}",
        compressed_bytes, uncompressed_bytes
    );
}
