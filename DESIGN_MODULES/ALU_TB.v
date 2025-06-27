// Testbench for 64-bit ALU
module ALU_TB;

    reg [63:0] A;      // Test input A
    reg [63:0] B;      // Test input B
    reg B_inv;         // Invert B for subtraction
    reg SEL0;          // Operation select 0
    reg SEL1;          // Operation select 1

    wire Ov;           // Overflow output
    wire [63:0] OUT;   // ALU output

    // Instantiate ALU
    ALU_design uut (.A(A), .B(B), .B_inv(B_inv), .SEL0(SEL0), .SEL1(SEL1), .Ov(Ov), .OUT(OUT));

    initial begin
        $dumpfile("dump.vcd");   // For waveform viewing
        $dumpvars(1);

        // Initialize inputs
        A = 16'h0000;
        B = 16'h0000;
        B_inv = 0;
        SEL0 = 0;
        SEL1 = 0;

        // Test addition (SEL0=0, SEL1=0)
        A = 16'h0010;   // A = 16
        B = 16'h0004;   // B = 4
        B_inv = 0;      // No inversion of B
        SEL0 = 0;       // Addition
        SEL1 = 0;
        #10;
        $display("Addition: A = %h, B = %h, OUT = %h, Ov = %b", A, B, OUT, Ov);

        // Test subtraction (SEL0=0, SEL1=0 with B_inv = 1)
        A = 16'h0010;   // A = 16
        B = 16'h0004;   // B = 4
        B_inv = 1;      // Inversion of B (for subtraction)
        SEL0 = 0;       // Addition, but with B_inv gives subtraction
        SEL1 = 0;
        #10;
        $display("Subtraction: A = %h, B = %h, OUT = %h, Ov = %b", A, B, OUT, Ov);

        // Test AND (SEL0=1, SEL1=0)
        A = 16'h00F0;   // A = 240
        B = 16'h0FF0;   // B = 4080
        B_inv = 0;      // No inversion of B
        SEL0 = 1;       // AND operation
        SEL1 = 0;
        #10;
        $display("AND: A = %h, B = %h, OUT = %h, Ov = %b", A, B, OUT, Ov);

        // Test OR (SEL0=0, SEL1=1)
        A = 16'h00F0;   // A = 240
        B = 16'h0FF0;   // B = 4080
        B_inv = 0;      // No inversion of B
        SEL0 = 0;       // OR operation
        SEL1 = 1;
        #10;
        $display("OR: A = %h, B = %h, OUT = %h, Ov = %b", A, B, OUT, Ov);

        // Test XOR (SEL0=1, SEL1=1)
        A = 16'h00F0;   // A = 240
        B = 16'h0FF0;   // B = 4080
        B_inv = 0;      // No inversion of B
        SEL0 = 1;       // XOR operation
        SEL1 = 1;
        #10;
        $display("XOR: A = %h, B = %h, OUT = %h, Ov = %b", A, B, OUT,Ov);
        
        // Test Inverse (SEL0=0, SEL1=0)
        A = 16'h0000;   // A = 0
        B = 16'h0FF0;   // B = 4080
        B_inv = 1;      // Inversion of B
        SEL0 = 0;       // Inverse operation (acts as subtraction)
        SEL1 = 0;
        #10;
        $display("XOR: A = %h, B = %h, OUT = %h, Ov = %b", A, B, OUT,Ov);
        
        $finish;        // End simulation
    end
    
endmodule