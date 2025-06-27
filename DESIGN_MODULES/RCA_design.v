// 64-bit Ripple Carry Adder Design
module RCA_design(
    input [63:0] A,   // 64-bit input A
    input [63:0] B,   // 64-bit input B
    input Cin,        // Carry-in
    output Cout,      // Carry-out
    output [63:0] S   // 64-bit Sum output
);

    wire [63:0] C;    // Internal carry wires

    // First full adder (LSB)
    FA_design FA0(.A(A[0]), .B(B[0]), .C(Cin), .Sum(S[0]), .Carry(C[0]));

    genvar i;
    generate
        // Instantiate 63 more full adders for each bit
        for (i = 1; i < 64; i = i + 1) begin : FA_loop
            FA_design FA_inst(.A(A[i]), .B(B[i]), .C(C[i-1]), .Sum(S[i]), .Carry(C[i]));
        end
    endgenerate

    assign Cout = C[63]; // Final carry-out

endmodule