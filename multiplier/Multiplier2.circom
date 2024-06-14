

// simple arithmetic circuit with 2 inputs and 1 output

template Multiplier2() {

    // singals are the input/output to the circuit
    // The witness will be assigned to these signals
    signal input a;
    signal input b;
    signal output c;

    // The circuit is satisfied if the output is the product of the inputs
    c <== a * b;
}

component main = Multiplier2();

// compile with: 
//  circom Multiplier2.circom --r1cs --wasm --sym

// to work w/ the compiled circuit:
//   snarkjs wtns calculate Multiplier2.wasm input.json witness.wtns

// to export the witness to json
//   snarkjs wtns export json witness.wtns witness.json
