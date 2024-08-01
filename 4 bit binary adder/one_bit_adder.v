module one_bit_adder (
    input wire v1,
    input wire v2,
    input wire cin,
    output reg sum,
    output reg cout

);
    always @(*) begin
        sum=(((~cin)&(v1)&(v2))|((~cin)&(v1)&(~v2))|((cin)&(~v1)&(~v2)|((cin)&(v1)&(v2))));
        cout=(((cin)&(v2))|((cin)&(v1))|((v1)&(v2)));


    end
endmodule