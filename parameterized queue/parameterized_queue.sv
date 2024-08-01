module parameterized_queue #(
    parameter int depth = 8
)(
    input logic reset,
    input logic clk,
    input logic enq,
    input logic deq,
    input logic [7:0] data_input,
    output logic [7:0] data_output,
    output logic full,
    output logic empty
);

logic [7:0] queue_main[depth-1:0];
logic [$clog2(depth)-1:0]  rear, front;
logic [$clog2(depth+1)-1:0] count;

assign full = (count == depth);
assign empty = (count == 0);

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        count <=3'b0;
        rear <= 0;
        front <= 0;
        data_output <= 8'b0;
    end else begin
        if (enq && !full) begin
            queue_main[rear] <= data_input;
            rear <= (rear + 1 == depth) ? 0 : rear + 1;
            count <= count + 1;
        end
        if (deq && !empty) begin
            data_output <= queue_main[front];
            front <= (front + 1 == depth) ? 0 : front + 1;
            count <= count - 1;
        end
    end
end

endmodule
