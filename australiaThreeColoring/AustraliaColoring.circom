pragma circom 2.1.9;



// This arithmetic circuit checks if a given 3 coloring of the Australian map is valid

// It does this by first checking if each state is colored with a valid color (1, 2, or 3)
// This is done by ensuring the following constraint is true
// 0 === (1 - stateColor) * (2 - stateColor) * (3 - stateColor) 

// Next, it checks if neighboring states are colored with different colors
// This is done by ensuring the following constraint is true
// 0 === (2 - state1Color * state2Color) * (3 - state1Color * state2Color) * (6 - state1Color * state2Color)
// This is done for each pair of neighboring states
// 2,3,6 are the only multiples of 1,2,3 that result in a valid coloring (i.e. not the same color for neighbors)


template AustraliaColoring() {

    // Variables representing the colors of each state
    // States: WA (Western Australia), SA (South Australia), NT (Northern Territory),
    // Q (Queensland), NSW (New South Wales), V (Victoria)
    // (1 = red, 2 = green, 3 = blue)
    signal input WA, SA, NT, Q, NSW, V;

    // intermediate signals to avoid cubic expressions
    signal WA_inter_color, SA_inter_color, NT_inter_color, Q_inter_color, NSW_inter_color, V_inter_color;

    // Color constraints for each state are valid if the state
    // is colored with an accepted color (1, 2, or 3)
    WA_inter_color <== (1 - WA) * (2 - WA); // full expr 0 === (1-WA) * (2-WA) * (3-WA)
    0 === WA_inter_color * (3 - WA);         // broken up to avoid cubic expression
    
    SA_inter_color <== (1 - SA) * (2 - SA);
    0 === SA_inter_color * (3 - SA);

    NT_inter_color <== (1 - NT) * (2 - NT);
    0 === NT_inter_color * (3 - NT);

    Q_inter_color <== (1 - Q) * (2 - Q);
    0 === Q_inter_color * (3 - Q);

    NSW_inter_color <== (1 - NSW) * (2 - NSW);
    0 === NSW_inter_color * (3 - NSW);

    V_inter_color <== (1 - V) * (2 - V);
    0 === V_inter_color * (3 - V);

    // intermediate signals for neighboring state contraints
    signal WA_SA, WA_NT, NT_SA, NT_Q, SA_Q, SA_NSW, SA_V, Q_NSW, NSW_V;

    // neighboring state colors multiplied must be either 2, 3, or 6
    // to be valid colorigns that are nto the same color
    WA_SA <== WA * SA;
    WA_NT <== WA * NT;
    NT_SA <== NT * SA;
    NT_Q <== NT * Q;
    SA_Q <== SA * Q;
    SA_NSW <== SA * NSW;
    SA_V <== SA * V;
    Q_NSW <== Q * NSW;
    NSW_V <== NSW * V;

    // intermediate boundary constraints
    signal WA_SA_b, WA_NT_b, NT_SA_b, NT_Q_b, SA_Q_b, SA_NSW_b, SA_V_b, Q_NSW_b, NSW_V_b;

    // Boundary constraints between states are valid if the states
    // are colored with different colors when they share a boundary
    // The reason for 2, 3, and 6 is that these are the multiples of color
    // combos that result in a valid coloring wrt neighboring states
    WA_SA_b <== (2 - WA_SA) * (3 - WA_SA);
    0 === WA_SA_b * (6 - WA_SA);

    WA_NT_b <== (2 - WA_NT) * (3 - WA_NT);
    0 === WA_NT_b * (6 - WA_NT);

    NT_SA_b <== (2 - NT_SA) * (3 - NT_SA); 
    0 === NT_SA_b * (6 - NT_SA);

    NT_Q_b <== (2 - NT_Q) * (3 - NT_Q);
    0 === NT_Q_b * (6 - NT_Q);

    SA_Q_b <== (2 - SA_Q) * (3 - SA_Q);
    0 === SA_Q_b * (6 - SA_Q);

    SA_NSW_b <== (2 - SA_NSW) * (3 - SA_NSW);
    0 === SA_NSW_b * (6 - SA_NSW);

    SA_V_b <== (2 - SA_V) * (3 - SA_V);
    0 === SA_V_b * (6 - SA_V);

    Q_NSW_b <== (2 - Q_NSW) * (3 - Q_NSW);
    0 === Q_NSW_b * (6 - Q_NSW);

    NSW_V_b <== (2 - NSW_V) * (3 - NSW_V);
    0 === NSW_V_b * (6 - NSW_V);
}

component main = AustraliaColoring();
