module seven_segment_display_tb;
      reg [3:0] number;
      wire [6:0] segments;
seven_segment_display uut(.number(number),.segments(segments));
integer i;
localparam period=10;
initial begin
    for (i =0 ;i<16 ;i=i+1 ) begin
        number=i;
        #period;
    end
end


endmodule