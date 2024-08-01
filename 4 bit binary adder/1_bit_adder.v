module one_bit_adder (
    input reg v1,
    input reg v2,
    input wire cin,
    output reg sum,
    output reg cout

);

    always @(*) begin
        assign sum = v1 ^ v2 ^ cin;
        assign cout = (v1 & v2) | (cin & (v1 ^ v2));


    end
endmodule