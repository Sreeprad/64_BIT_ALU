// 64-bit ALU Design
module ALU_design(
    input [63:0] A,      // Operand A
    input [63:0] B,      // Operand B
    input B_inv,         // Invert B for subtraction
    input SEL0,          // Operation select line 0
    input SEL1,          // Operation select line 1
    output Ov,           // Overflow flag
    output [63:0] OUT    // ALU output
);

    wire [63:0] w;           // B or ~B depending on B_inv
    wire x1, x2;             // Intermediate wires
    wire [63:0] S;           // Sum output from adder
    wire [63:0] AND_out;     // AND operation result
    wire [63:0] OR_out;      // OR operation result
    wire [63:0] XOR_out;     // XOR operation result

    genvar i;
    generate
        // Select B or ~B for each bit based on B_inv (for add/sub)
        for (i = 0; i < 64; i = i + 1) begin
            MUX2_1_design m(B[i], ~B[i], B_inv, w[i]);
        end
    endgenerate

    // 64-bit adder/subtractor
    RCA_design RCA(.A(A), .B(w), .Cin(B_inv), .S(S), .Cout(x2));

    // Overflow calculation (for signed operations)
    xor(Ov, B_inv, x2);

    // Bitwise logic operations
    assign AND_out = A & B;
    assign OR_out  = A | B;
    assign XOR_out = A ^ B;

    generate
        // Select final output using 4:1 MUX for each bit
        // 00: ADD/SUB, 01: AND, 10: OR, 11: XOR
        for (i = 0; i < 64; i = i + 1) begin
            MUX4_1_design mux(S[i], AND_out[i], OR_out[i], XOR_out[i], SEL0, SEL1, OUT[i]);
        end
    endgenerate

endmodule