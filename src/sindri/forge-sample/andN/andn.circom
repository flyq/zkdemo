pragma circom 2.1.6;

template binaryCheck () {
	//Declaration of signals.
	signal input in;
	signal output out;

	//Statements.
	in * (in-1) === 0;
	out <== in;
}

template Multiplier2 () {
	//Declaration of signals.
	signal input in1;
	signal input in2;
	signal output out;

	//Statements.
	out <== in1 * in2;
}

template AndN (N){
	//Declaration of signals and components.
	signal input in[N];
	signal output out;

	component binCheck[N];
	component mult[N-1];

	//Statements.
	for(var i = 0; i < N; i++){
		binCheck[i] = binaryCheck();
			binCheck[i].in <== in[i];
	}
	for(var i = 0; i < N-1; i++){
		mult[i] = Multiplier2();
	}
	mult[0].in1 <== binCheck[0].out;
	mult[0].in2 <== binCheck[1].out;
	for(var i = 0; i < N-2; i++){
		mult[i+1].in1 <== mult[i].out;
		mult[i+1].in2 <== binCheck[i+2].out;

	}
	out <== mult[N-2].out; 
}

component main = AndN(8);