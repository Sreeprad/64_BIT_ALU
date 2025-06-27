// 2:1 Multiplexer Design
module MUX2_1_design(
    input D0,    // Data input 0
    input D1,    // Data input 1
    input S,     // Select line
    output Y     // Output
    );
    wire w1, w2, w3;

    not U1(w1, S);         // Invert select
    and U2(w2, D0, w1);    // D0 selected when S=0
    and U3(w3, D1, S);     // D1 selected when S=1
    or U4(Y, w2, w3);      // Output

endmodule