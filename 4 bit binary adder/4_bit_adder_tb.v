module four_bit_adder_tb ;
    reg    [3:0]v1;
    reg   [3:0]v2;
    
    wire  [4:0]sum;
    wire  cout;
  
four_bit_adder uut(.v1(v1),.v2(v2), .sum(sum), .cout(cout));
localparam period = 10;
integer i,j,k,l;
initial begin
    
    for (i=0;i<16;i=i+1)begin
        for (j=0;j<16;j=j+1)begin
                v1=i;
                v2=j;
                    
                #period;
                end
                
    end
            
       
end
       


    
endmodule