// Full Adder Design
module FA_design(
    input A,      // First input bit
    input B,      // Second input bit
    input C,      // Carry-in
    output Sum,   // Sum output
    output Carry  // Carry-out
    );

    wire X1, X2;
    wire C1, C2;

    // Sum calculation
    xor (X1, A, B);
    xor (Sum, X1, C);

    // Carry calculation
    and (C1, A, B);
    and (C2, C, X1);
    or (Carry, C1, C2);

endmodule

