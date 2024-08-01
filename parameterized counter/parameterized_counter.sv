module parameterized_counter #(parameter data_width = 4)

(   
    input logic [data_width-1:0]inital_value,
    input logic reset,
    input logic  clk,
    
    input  logic up_and_down,
    output logic  [data_width-1:0] out 
);
logic [data_width-1:0] count=0 ;
always_ff @( posedge clk or  reset ) begin 
    if ( reset) begin
        count<=inital_value;
        end
    else if (up_and_down==1'b1) begin
        count<=count+1'b1;  
    end
    else begin
        count<= count-1'b1;
    end
    
    
    end
assign out = count;
     

    
endmodule