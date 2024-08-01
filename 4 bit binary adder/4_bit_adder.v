module four_bit_adder (
    input reg  [3:0]v1,
    input reg  [3:0]v2,
    
    output wire [4:0]sum,
    output wire cout

);
wire [2:0] carry;
wire cin;   
assign cin=1'b0;
    
        one_bit_adder adder0 (.v1(v1[0]), .v2(v2[0]), .cin(cin),      .sum(sum[0]), .cout(carry[0]));
        
        one_bit_adder adder1 (.v1(v1[1]), .v2(v2[1]), .cin(carry[0]),      .sum(sum[1]), .cout(carry[1]));

        one_bit_adder adder2 (.v1(v1[2]), .v2(v2[2]), .cin(carry[1]),      .sum(sum[2]), .cout(carry[2]));

        one_bit_adder adder3 (.v1(v1[3]), .v2(v2[3]), .cin(carry[2]),      .sum(sum[3]), .cout(cout));
    assign sum[4] = cout;
endmodule