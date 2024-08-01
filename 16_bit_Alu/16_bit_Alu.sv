module sixteen_bit_Alu (
    input logic [15:0] num1,
    input logic [15:0] num2,
    input logic [2:0] output_opreation_selector,
    output logic [16:0] output_opreation_value
);
always_comb begin 
    case (output_opreation_selector)
        3'b000: output_opreation_value = num1 + num2;
        3'b001: output_opreation_value = num1 - num2;
        3'b010: output_opreation_value = num1 & num2;
        3'b011: output_opreation_value = num1 | num2;
        3'b100: output_opreation_value = num1 ^ num2;
        default: output_opreation_value = num1 & num2;
    endcase
end
endmodule
