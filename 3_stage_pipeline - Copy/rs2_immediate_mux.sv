module rs2_immediate_mux (
    input logic [31:0] mux_input,
    input logic [31:0]data2,
    input logic sel_B,
    output logic[31:0] b
);
always_comb begin 
    if (sel_B) begin
        b=mux_input;
    end
    else begin
        b=data2;
    end   
end   
endmodule