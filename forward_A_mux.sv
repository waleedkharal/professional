module forward_A_mux (
    input logic [31:0] write_back_data,read_data_1,
    input logic clock,reset,forward_select_A,
    output logic[31:0] data1 
);
always_ff @( posedge clock ) begin : forward_A_mux
 if (forward_select_A) begin
    data1<=write_back_data;
    
 end
 else begin
    data1 <= read_data_1;
 end
    
end
    
endmodule