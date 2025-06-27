// 4:1 Multiplexer Design using 2:1 MUXes
module MUX4_1_design (
    input D0,    // Data input 0
    input D1,    // Data input 1
    input D2,    // Data input 2
    input D3,    // Data input 3
    input S0,    // Select line 0 (LSB)
    input S1,    // Select line 1 (MSB)
    output Y     // Output
);
    wire Y0, Y1;

    // First stage: select between D0/D1 and D2/D3
    MUX2_1_design MUX0 (.D0(D0), .D1(D1), .S(S0), .Y(Y0));
    MUX2_1_design MUX1 (.D0(D2), .D1(D3), .S(S0), .Y(Y1));
    // Second stage: select between outputs of first stage
    MUX2_1_design MUX2 (.D0(Y0), .D1(Y1), .S(S1), .Y(Y));

endmodule