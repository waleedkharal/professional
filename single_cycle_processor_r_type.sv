module single_cycle_processor (
    input logic clock,
    input logic reset
);
    // Internal signals
    logic [31:0]  pc_next, read_data_1, read_data_2, machine_code, write_back_data,
     alu_out, immediate_output, b, data_memory_output, bc_pc_out, a, pc_with_four_out
     ,pc_execute,pipe_line_instruction, data1, data2, addr_mem, wdata_mem,
      instruction_mem , pc_mem , pc_next_mem ,mux_output   ;
    logic [3:0]   alu_op;
    logic [2:0]   branch_type;
    logic [1:0]   sel_dm,wb_sel_mem;
    logic write_register_enable, sel_B, read_enable, write_enable,branch_taken,sel_A,reg_wr_mem,stall,
    rd_wr_mem_mem,mem_wr_mem,forward_select_A,forward_select_B;

    
    pc program_counter (
        .clock(clock),
        .reset(reset),
        .pc(bc_pc_out),
        .pc_next(pc_next)
    );

    
    instruction_memory instr_mem (
        .write_address_G(pc_next), 
        .machine_code(machine_code)
    );

    first_pipe_line first_pipe_line(
        .clock(clock),
        .reset(reset),
        .pc_next(pc_next),
        .machine_code(machine_code),
        .stall(stall),
        .branch_taken(branch_taken),
        .pc_execute(pc_execute),
        .pipe_line_instruction(pipe_line_instruction)

    );

    
    register_file reg_file (
        .clock(clock),
        .reset(reset),
        .read_address_1(pipe_line_instruction[19:15]),
        .read_address_2(pipe_line_instruction[24:20]),
        .write_address(pipe_line_instruction[11:7]),
        .write_back_data(write_back_data),
        .write_register_enable(reg_wr_mem),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2)
    );

    
        // Correct module name and port connection
    immediate imm_gen (
        .instructions(pipe_line_instruction),
        .immediate_out(immediate_output)  // Port name matches the module's output
    );

    forward_A_mux forward_A_mux(
        .write_back_data(write_back_data),
        .read_data_1(read_data_1),
        .clock(clock),
        .reset(reset),
        .forward_select_A(forward_select_A),
        .data1(data1)

    );
    forward_B_mux forward_B_mux(
        .write_back_data(write_back_data),
        .read_data_2(read_data_2),
        .clock(clock),
        .reset(reset),
        .forward_select_B(forward_select_B),
        .data2(data2)
    );

    rs1_pc_mux rs1_pc_mux(
        .pc_next(pc_next),
        .read_data_1(data1),
        .sel_A(sel_A),
        .a(a)
    );

    rs2_immediate_mux mux (
        .mux_input(immediate_output),
        .read_data_2(data2),
        .sel_B(sel_B),
        .mux_output(mux_output)
    );
    
    controller ctrl (
        .instructions(pipe_line_instruction),
        .instruction_mem(instruction_mem),
        .write_register_enable(write_register_enable),
        .sel_B(sel_B),
        .alu_op(alu_op),
        .read_enable(read_enable),
        .write_enable(write_enable),
        .sel_dm(sel_dm),
        .sel_A(sel_A),
        .branch_type(branch_type),
        .stall(stall)
        
    );

 
    alu arithmetic_logic_unit (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .alu_out(alu_out)
    );
    pipe_line_2_reg pipe_line_2_reg(
        .clock(clock),
        .reset(reset),.read_enable(read_enable),
        .write_enable(write_enable),
        .write_register_enable(write_register_enable),
        .sel_dm(sel_dm),
        .data2(data2),
        .alu_out(alu_out),
        .pipe_line_instruction(pipe_line_instruction),
        .rd_wr_mem_mem(rd_wr_mem_mem),
        .mem_wr_mem(mem_wr_mem),
        .reg_wr_mem(reg_wr_mem),
        .wb_sel_mem(wb_sel_mem),
        .addr_mem(addr_mem),
        .wdata_mem(wdata_mem),
        .instruction_mem(instruction_mem),
        .pc_execute(pc_execute),
        .pc_mem(pc_mem)


    );

    data_memory data_mem (
        .data_memory_input(addr_mem), // Address to access
        .write_data(wdata_mem), // Data to be written
        .clock(clock),
        .reset(reset),
        .write_enable(mem_wr_mem),
        .read_enable(rd_wr_mem_mem),
        .data_memory_output(data_memory_output) // Data to be read
    );
 
    pc_dm_with_four pc_dm_with_four(
        .pc_mem(pc_mem),
        .pc_next_mem(pc_next_mem)
    );

    data_memory_mux dm_mux(
        .data_memory_output(data_memory_output),
        .sel_dm(wb_sel_mem),
        .alu_out(addr_mem),
        .pc_next_mem(pc_next_mem),
        .write_back_data(write_back_data)
    );

    
     
    branch_condition bc(
        .read_data_1(data1),
        .read_data_2(data2),
        .branch_type(branch_type),
        .branch_taken(branch_taken)
    );

    bc_pc_mux bc_pc_mux(
        .pc_with_four_out(pc_with_four_out),
        .alu_out(alu_out),
        .bc_pc_out(bc_pc_out),
        .branch_taken(branch_taken)
    );

    

    pc_with_four four(
        .pc_next(pc_next),
        .pc_with_four_out(pc_with_four_out)
    );

    

    
endmodule
