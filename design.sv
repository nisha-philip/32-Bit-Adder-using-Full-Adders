// Code your design here
module FullAdder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

module RippleCarryAdder32(
    input [31:0] A,
    input [31:0] B,
    input Cin,
    output [31:0] Sum,
    output Cout
);
    wire [31:0] Carry;

    // Instantiate 32 Full Adders
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : Adder
            if (i == 0) begin
                // First Full Adder
                FullAdder FA (
                    .A(A[i]),
                    .B(B[i]),
                    .Cin(Cin),
                    .Sum(Sum[i]),
                    .Cout(Carry[i])
                );
            end else begin
                // Other Full Adders
                FullAdder FA (
                    .A(A[i]),
                    .B(B[i]),
                    .Cin(Carry[i-1]),
                    .Sum(Sum[i]),
                    .Cout(Carry[i])
                );
            end
        end
    endgenerate

    // Carry out
    assign Cout = Carry[31];

endmodule
