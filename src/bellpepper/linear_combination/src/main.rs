use bellpepper_core::{Index, LinearCombination, Variable};
use blstrs::Scalar;
use ff::Field;

fn main() {
    println!("Hello, world!");
    lc_add_simplify();
}

fn lc_add_simplify() {
    let size = 5;
    let mut lc = LinearCombination::<Scalar>::zero();

    let mut expecteds = vec![Scalar::ZERO; size];
    let mut total_additions = 0;
    for (i, expected) in expecteds.iter_mut().enumerate() {
        for _ in 0..i + 1 {
            let coeff = Scalar::ONE;
            lc = lc + (coeff, Variable::new_unchecked(Index::Aux(i)));
            *expected += coeff;
            total_additions += 1;
        }
    }

    assert_eq!(size, lc.len());
    assert_ne!(lc.len(), total_additions);

    println!("{:?}", lc);
}
