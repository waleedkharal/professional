module first_pipe_line (

    input logic [31:0]pc_next,
    input logic [31:0]machine_code,
    input logic       stall,clock,reset,branch_taken,
    output logic[31:0] pc_execute,
    output logic[31:0] pipe_line_instruction
);
always_ff @( posedge clock ) begin : first_pipe_line
    

    if (reset | stall | branch_taken ) begin
        pc_execute<=32'b0;
        pipe_line_instruction<=32'h00000013;
        
        
    end
    else begin
        pipe_line_instruction=machine_code;
        pc_execute=pc_next;
    end
end 
    
endmodule