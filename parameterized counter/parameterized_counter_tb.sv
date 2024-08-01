module parameterized_counter_tb ();
    logic clk = 1'b0;
    logic reset=1'b0;
    logic [3:0]inital_value=4'b0;
    logic up_and_down = 1'b0;
    logic [3:0] out;
    


parameterized_counter counter(
    .clk(clk),
    .reset(reset),
    
    .up_and_down(up_and_down),
    .inital_value(inital_value),
    .out(out));
integer i;
initial begin
    

for (i =0 ;i<16 ;i++ ) begin
    #2 reset = $random;
    #2 up_and_down = $random;
    #2 up_and_down = $random;
    #2 inital_value = $random;
    
end
end
//clk 
always     
#0.5 
clk=~clk;
// generate stimulus
endmodule