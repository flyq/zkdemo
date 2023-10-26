use bellpepper_core::{Index, LinearCombination, Variable};
use blstrs::Scalar;
use ff::Field;

fn main() {
    lc_add_simplify();
}

fn lc_add_simplify() {
    let mut lc1 = LinearCombination::<Scalar>::default();
    let mut lc2 = LinearCombination::<Scalar>::default();
    let mut lc3 = LinearCombination::<Scalar>::default();

    let one = Scalar::ONE;
    let two = one + one;

    lc1 = lc1 + (one, Variable::new_unchecked(Index::Aux(0)));

    lc2 = lc2 + (two, Variable::new_unchecked(Index::Aux(1)));
    lc2 = lc2 + (one, Variable::new_unchecked(Index::Aux(2)));
    lc2 = lc2 + (one, Variable::new_unchecked(Index::Aux(1)));

    lc3 = lc3 + (two, Variable::new_unchecked(Index::Input(3)));

    lc3 = lc3 + &lc2;

    println!("{:?}\n{:?}\n{:?}", lc1, lc2, lc3);
}
