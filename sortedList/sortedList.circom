pragma circom 2.1.9;


// Arithmetic circuit for u >= v for 3 bit numbers
//
// constaints:
// 1.) u and v are at most n-1 bit numbers
// 2.) arithmetic circuit encodes binary representations of 2 ^ (n-1) + (u-v) using n bits
// 3.) if the MSB of 2^(n-1) + (u-v) us 1, then u >= v and vice versa. This is because 
//     2^(n-1) is the midpoint of the possible values representable by n bits, therefore
//     if the MSB is 1, then the value is greater than or equal to 2^(n-1) and vice versa.
template GTE() {
    // Integer representation of u and v
    signal input u, v;

    // Binary encoding of u and v
    signal input u_bit_0, u_bit_1, u_bit_2;
    signal input v_bit_0, v_bit_1, v_bit_2;

    // Binary result of 2^(n-1) + (u-v)
    signal input c_bit_0, c_bit_1, c_bit_2;

    // Ensure the binary encoding is correct
    u === u_bit_0 + 2 * u_bit_1 + 4 * u_bit_2;
    v === v_bit_0 + 2 * v_bit_1 + 4 * v_bit_2;

    // 0 or 1 constraints
    u_bit_0 * (u_bit_0 - 1) === 0;
    u_bit_1 * (u_bit_1 - 1) === 0;
    u_bit_2 * (u_bit_2 - 1) === 0;
    v_bit_0 * (v_bit_0 - 1) === 0;
    v_bit_1 * (v_bit_1 - 1) === 0;
    v_bit_2 * (v_bit_2 - 1) === 0;
    c_bit_0 * (c_bit_0 - 1) === 0;
    c_bit_1 * (c_bit_1 - 1) === 0;
    c_bit_2 * (c_bit_2 - 1) === 0;

    // 2^(n-1) + (u-v) binary representation 
    4 + (u - v) === c_bit_0 + 2 * c_bit_1 + 4 * c_bit_2;

    // Ensure that the MSB of 2^(n-1) + (u-v) is 1 (u >= v)
    c_bit_2 === 1;
}

// // Arithmetic circuit for checking if a list is sorted by comparing successive elements with GTE
// template isSorted() {

//     // Define inputs for integer values and their binary representations
//     signal input list[4]; // Array of integers
//     signal input list_bits[4][3]; // Corresponding binary bits for each integer

//     signal output sorted;

//     component gte_comparisons[3];

//     for (var i = 0; i < 3; i++) {
//         gte_comparisons[i] = GTE();

//         // Connecting integer values to GTE
//         gte_comparisons[i].u <== list[i + 1];
//         gte_comparisons[i].v <== list[i];

//         // Connecting binary representations of integer values to GTE
//         gte_comparisons[i].u_bit_0 <== list_bits[i + 1][0];
//         gte_comparisons[i].u_bit_1 <== list_bits[i + 1][1];
//         gte_comparisons[i].u_bit_2 <== list_bits[i + 1][2];
//         gte_comparisons[i].v_bit_0 <== list_bits[i][0];
//         gte_comparisons[i].v_bit_1 <== list_bits[i][1];
//         gte_comparisons[i].v_bit_2 <== list_bits[i][2];
//     }

//     // All comparisons must be true for the list to be sorted
//     sorted <== gte_comparisons[0].ge * gte_comparisons[1].ge * gte_comparisons[2].ge;
// }

component main = GTE();