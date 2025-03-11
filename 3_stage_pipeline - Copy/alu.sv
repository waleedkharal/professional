module alu (
    input logic [31:0] a, b,       // 32-bit input operands
    input logic [3:0]  alu_op,     // 4-bit ALU operation code
    output logic [31:0] alu_out    // 32-bit ALU output
);

always_comb begin
    case (alu_op)
        4'd0  : alu_out = a + b;                          // ADD
        4'd1  : alu_out = a - b;                          // SUB
        4'd2  : alu_out = a << b;                         // Logical shift left
        4'd3  : alu_out = ($signed(a)) < ($signed(b));    // Signed comparison
        4'd4  : alu_out = ($unsigned(a)) < ($unsigned(b));// Unsigned comparison
        4'd5  : alu_out = a ^ b;                          // Bitwise XOR
        4'd6  : alu_out = a >> b[4:0];                    // Logical shift right
        4'd7  : alu_out = a >>> b[4:0];                   // Arithmetic shift right
        4'd8  : alu_out = a | b;                          // Bitwise OR
        4'd9  : alu_out = a & b;                          // Bitwise AND
        4'd10 : alu_out = (a < b) ? 1 : 0;                // Less than comparison
        4'd11 : alu_out = ($unsigned(a) < $unsigned(b)) ? 1 : 0; // Unsigned less than comparison
        4'd12 : alu_out = b;                              // Pass through B
        default: alu_out = a + b;                         // Default to ADD
    endcase
end

endmodule