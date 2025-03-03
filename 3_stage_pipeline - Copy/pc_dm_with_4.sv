module pc_dm_with_four(
    input [31:0] pc_mem,
    output logic[31:0] pc_next_mem
);
always_comb begin
    pc_next_mem=pc_mem+32'h4;
end
endmodule