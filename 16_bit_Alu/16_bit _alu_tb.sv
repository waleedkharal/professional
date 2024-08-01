module sixteen_bit_Alu_tb;

logic [15:0] num1;
logic  [15:0] num2;
logic [2:0] output_opreation_selector;
logic [16:0] output_opreation_value;
sixteen_bit_Alu uut(.num1(num1),.num2(num2),.output_opreation_selector(output_opreation_selector),.output_opreation_value(output_opreation_value));
integer i,j,k;
localparam period=10;
initial begin
    for (i =0 ;i<8 ;i++ ) begin
        //for (j =0 ;j<65536 ;j++ ) begin
        for (j =0 ;j<3 ;j++ ) begin
            //for (k=0  ;k<65536 ;k++ ) begin
            for (k=0  ;k<3 ;k++ ) begin
                output_opreation_selector=i;
                num1=j;
                num2=k;
                #period;
                
            end
            
        end
        
    end
    
    

       
       
end
    
endmodule 



