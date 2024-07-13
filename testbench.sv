// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module RippleCarryAdder32_tb;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;
    reg Cin;

    // Outputs
    wire [31:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    RippleCarryAdder32 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;
        Cin = 0;

        // Apply test vectors
        #10 A = 32'h00000001; B = 32'h00000001; Cin = 0; // Test 1: 1 + 1
        #10 A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0; // Test 2: Max + 1
        #10 A = 32'h12345678; B = 32'h87654321; Cin = 0; // Test 3: Random values
        #10 A = 32'hAAAAAAAA; B = 32'h55555555; Cin = 0; // Test 4: Pattern test
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; Cin = 0; // Test 5: Max + Max

        // Wait 10 time units and finish
        #10 $finish;
    end

    initial begin
        $monitor("Time = %0dns, A = %h, B = %h, Cin = %b, Sum = %h, Cout = %b", 
                 $time, A, B, Cin, Sum, Cout);
    end

    initial begin
        $dumpfile("dump.vcd"); // Name of the VCD file
        $dumpvars(0, RippleCarryAdder32_tb); // Dump all variables in the testbench
    end

endmodule
