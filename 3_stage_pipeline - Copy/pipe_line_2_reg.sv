module pipe_line_2_reg (
    input logic clock,reset,read_enable,write_enable,write_register_enable,stall,
    input logic [1:0] sel_dm,
    input logic [31:0] data2,alu_out,pipe_line_instruction,pc_execute,
    output logic rd_wr_mem_mem,mem_wr_mem,reg_wr_mem,
    output logic [1:0]wb_sel_mem,
    output logic [31:0] addr_mem,wdata_mem,instruction_mem,pc_mem
);
always_ff @( posedge clock ) begin 
    if (reset | stall  ) begin
        instruction_mem<=32'h00000013;
        addr_mem<=32'b0;
        wdata_mem<=32'b0;
        wb_sel_mem<=2'b0;
        rd_wr_mem_mem<=1'b0;
        mem_wr_mem<=1'b0;
        reg_wr_mem<=1'b0;
        pc_mem<=32'b0;

    
    end
    else begin
        instruction_mem<=pipe_line_instruction;
        addr_mem<=alu_out;
        wdata_mem<=data2;
        wb_sel_mem<=sel_dm;
        rd_wr_mem_mem<=read_enable;
        mem_wr_mem<=write_enable;
        reg_wr_mem<=write_register_enable;
        pc_mem<=pc_execute;

    end
    
end
    
endmodule