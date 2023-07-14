pragma circom 2.1.6;

// Inputs:
// * `in` is a fixed length array of 100 tuples
// * `match` is a arbitrary input value
// Outputs:
// * `num_match` is the number of elements of `in` whose first entry 
//   matches `match`
// * the first `num_match` entries of `out` are the tuples in `in` 
//   whose first entry agrees with `match`.  the remaining entries
//   in `out` are 0-padded.

template EqualCheck () {
    signal input in1;
    signal input in2;
    signal output out;

    assert(in1 == in2);
    out <== in1;
}

template NotEqualCheck () {
    signal input in1;
    signal input in2;
    signal output out;

    assert(in1 != in2);
    out <== 0;
}

template Filter() {
    signal input in[100];
    signal input match;
    signal output num_match;
    signal output out[100];
    
    // Fill in your solution here
    var index_raw = 100; 
    var flag = 1;

    for(var i = 0; i < 100; i++) {
        if(in[i] != match && flag == 1) {
            index_raw = i;
            flag = 0;
        }  
    }

    component equalCheck[100];
    component notEqualCheck[100];

    // i< index_raw
    for(var i = 0; i < 100; i++) {
            equalCheck[i] = EqualCheck();
            equalCheck[i].in1 <== match;
            equalCheck[i].in2 <== in[i];
            out[i] <== equalCheck[i].out;
    }
    // num_match <== index_raw;

}

component main = Filter();