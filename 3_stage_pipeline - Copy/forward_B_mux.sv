module forward_B_mux (
    input logic [31:0] write_back_data,read_data_2,
    input logic clock,reset,forward_select_B,
    output logic [31:0]data2 
);
always_comb begin : forward_B_mux
 if (forward_select_B) begin
    data2<=write_back_data;
    
 end
 else begin
    data2 <= read_data_2;
 end
    
end
    
endmodule