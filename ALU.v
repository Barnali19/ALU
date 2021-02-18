/*
    ALU:
    in: in1, in2
    out: alu_out
    flags: overflow, parity, zero, carry
    
    alu_op      operation
    000         NOP
    001         ADD
    010         SUB
    011         AND
    100         OR
    101         NOT

*/
module ALU(in1, in2, alu_op, alu_out, carry, odd_parity, zero, overflow);
    input [7:0] in1, in2;
    input [2:0] alu_op;
    output reg [7:0] alu_out;
    output reg carry, odd_parity, zero, overflow;

    always @(alu_op)
    begin
        case (alu_op)
            3'b000: ;// NOP
            3'b001: {carry, alu_out} = in1 + in2;   // ADD
            3'b010: alu_out = in1 - in2;            // SUB
            3'b011: alu_out = in1 & in2;            // AND
            3'b100: alu_out = in1 | in2;            // OR
            3'b101: alu_out = ~in1;                 // NOT
            default: alu_out = 8'bxxxxxxxx;         // undefined
        endcase

        odd_parity = ^alu_out;
        zero = ~|alu_out;
        overflow = (in1[7] & in2[7] & ~alu_out[7]) | (~in1[7] & ~in2[7] & alu_out[7]);
    end

endmodule

module tb;
    reg [7:0] in1, in2;
    reg [2:0] alu_op;
    wire [7:0] alu_out;
    wire carry, odd_parity, zero, overflow;

    ALU alu_test(.in1(in1),
                 .in2(in2),
                 .alu_op(alu_op),
                 .alu_out(alu_out),
                 .carry(carry),
                 .zero(zero),
                 .odd_parity(odd_parity),
                 .overflow(overflow));

    initial begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0, tb);
        $monitor($time, "in1=%d, in2=%d, alu_op=%b, alu_out=%d, carry=%b, zero=%b, odd_parity=%b, overflow=%b",
                         in1, in2, alu_op, alu_out,
                         carry, zero, odd_parity, overflow);

        #1 in1 = 12; in2 = 11;
        #1 alu_op = 3'b000;
        #1 alu_op = 3'b001;
        #1 alu_op = 3'b010;
        #1 alu_op = 3'b011;
        #1 alu_op = 3'b100;
        #1 alu_op = 3'b101;

        #1 in1 = 8'b10111111; in2 = 8'b10111111;
        #1 alu_op = 3'b010;
        #1 alu_op = 3'b011;

        #1 $finish;
        
    end
endmodule

