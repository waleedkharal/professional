module rs2_immediate_mux (
    input logic [31:0] mux_input,
    input logic [31:0]read_data_2,
    input logic sel_B,
    output logic[31:0] mux_output
);
always_comb begin 
    if (sel_B) begin
        mux_output=mux_input;
    end
    else begin
        mux_output=read_data_2;
    end   
end   
endmodule