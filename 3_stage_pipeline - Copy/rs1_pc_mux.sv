module rs1_pc_mux (
    input logic [31:0]pc_next,
    input logic [31:0]data1,
    input logic       sel_A,
    output logic [31:0]     a
);
always_comb begin
    if (sel_A) begin
        a=data1;
    end
    else begin
        a=pc_next;
    end
end
    
endmodule