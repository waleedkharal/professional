module instruction_memory (
    input logic [31:0] write_address_G,
    output logic [31:0] machine_code
);
logic [31:0]instruction_memory_reg  [31:0];
always_comb begin
    machine_code=instruction_memory_reg[write_address_G>>2];
end
initial begin
     
       
        integer i;
        for (i = 0; i < 32; i = i + 1) begin
            instruction_memory_reg[i] = 32'h00000000;
        end
//instruction_memory_reg[1]=32'h123450b7;
//instruction_memory_reg[2]=32'h12345117;
//instruction_memory_reg[3]=32'h00a00113;
//instruction_memory_reg[4]=32'h01400093;
//instruction_memory_reg[5]=32'h0080006f;
//instruction_memory_reg[6]=32'h01e00113;
//instruction_memory_reg[7]=32'h001101b3;
//instruction_memory_reg[8]=32'h003022a3;
//instruction_memory_reg[9]=32'h00502303;
//instruction_memory_reg[10]=32'h00008067;
//instruction_memory_reg[11]=32'h00000013;
//instruction_memory_reg[12]=32'h0000A093;
//instruction_memory_reg[13]=32'h00101493;
//instruction_memory_reg[14]=32'h00A303B3;
//instruction_memory_reg[15]=32'h0;
    instruction_memory_reg[0] = 32'h00500093; // addi x1, x0, 5 - Completes in Cycle 3
    instruction_memory_reg[1] = 32'h00A08113; // addi x2, x1, 10 - Completes in Cycle 4
    instruction_memory_reg[2] = 32'h00208263; // beq x1, x2, label - Completes in Cycle 5 (branch decision made)
    instruction_memory_reg[3] = 32'h00F00393; // addi x3, x0, 15 - Completes in Cycle 6
    instruction_memory_reg[4] = 32'h01400213; // addi x4, x0, 20 - Completes in Cycle 7
    



    //instruction_memory_reg[2] = 32'h002081B3; // add x3, x1, x2 - Completes in Cycle 5
    //instruction_memory_reg[3] = 32'h00208263; // beq x1, x2, label - Completes in Cycle 5 (branch decision made)
    //instruction_memory_reg[4] = 32'h01400213; // addi x4, x0, 20 - Completes in Cycle 7
    //instruction_memory_reg[5] = 32'h01E00293; // addi x5, x0, 30 - Completes in Cycle 8
//end
end
endmodule








































