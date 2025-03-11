module branch_condition (
    input logic [31:0]data1,
    input logic [31:0]data2,
    input logic [2:0]      branch_type,
    output logic      branch_taken

);
always_comb begin
    case (branch_type)
        3'd0: branch_taken=(data1==data2) ? 1'b1 : 1'b0 ;
        3'd1: branch_taken=(data1!=data2) ? 1'b1 : 1'b0 ;
        3'd4: branch_taken=(data1<data2) ? 1'b1 : 1'b0 ;
        3'd6: branch_taken=(($unsigned(data1)) < ($unsigned(data2))) ? 1'b1 : 1'b0 ;
        3'd5: branch_taken=(data1>=data2) ? 1'b1 : 1'b0; 
        3'd7: branch_taken=(($unsigned(data1))>=($unsigned(data2))) ? 1'b1 :1'b0 ;
        3'd2: branch_taken=3'd0;
        3'd3: branch_taken=1'b1;
        
        default:branch_taken=1'b0; 
    endcase
end
    
endmodule