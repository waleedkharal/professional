module parameterized_queue_tb();
    logic reset;
    logic clk = 1'b0;
    logic enq = 1'b0;
    logic deq = 1'b0;
    logic [7:0] data_input = 8'b0;
    logic [7:0] data_output;
    logic full;
    logic empty;

    parameterized_queue uut(
        .reset(reset),
        .clk(clk),
        .enq(enq),
        .deq(deq),
        .data_input(data_input),
        .data_output(data_output),
        .full(full),
        .empty(empty)
    );

    integer i;

    always #5 clk = ~clk; 

    initial begin
        reset = 1'b1;
        #10;
        reset = 1'b0;
        #10;

        
        for (i = 0; i < 16; i++) begin
            if (!full) begin
                enq = 1'b1;
                data_input = $random;
                #10;
                enq = 1'b0;
                #10; 
            end
        end
        
        for (i = 0; i < 16; i++) begin
            if (!empty) begin
                deq = 1'b1;
                #10;
                deq = 1'b0;
                #10; 
            end
        end

        if (empty) begin
            $display("Queue is empty as expected.");
        end else begin
            $display("Queue is not empty, there might be an issue.");
        end
        if (full) begin
            $display("Queue is full as expected.");
        end else begin
            $display("Queue is not full, there might be an issue.");
        end

        $stop;
    end
endmodule
