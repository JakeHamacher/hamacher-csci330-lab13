module mux_2x1 (
    input wire A,
    input wire B,
    input wire S,
    output reg O
);

always @(A, B, S)
begin
    if (S == 1'b0)
        O = A;
    else
        O = B;
end

endmodule


module mux_2x1_tb;

    reg A, B, S;
    wire O;

    mux_2x1 uut (
        .A(A),
        .B(B),
        .S(S),
        .O(O)
    );

    reg clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Test all combinations of inputs
        A = 0; B = 0; S = 0; #10; $display("Input: A=%b, B=%b, S=%b, Output: O=%b", A, B, S, O);
        A = 0; B = 0; S = 1; #10; $display("Input: A=%b, B=%b, S=%b, Output: O=%b", A, B, S, O);
        A = 0; B = 1; S = 0; #10; $display("Input: A=%b, B=%b, S=%b, Output: O=%b", A, B, S, O);
        A = 0; B = 1; S = 1; #10; $display("Input: A=%b, B=%b, S=%b, Output: O=%b", A, B, S, O);
        A = 1; B = 0; S = 0; #10; $display("Input: A=%b, B=%b, S=%b, Output: O=%b", A, B, S, O);
        A = 1; B = 0; S = 1; #10; $display("Input: A=%b, B=%b, S=%b, Output: O=%b", A, B, S, O);
        A = 1; B = 1; S = 0; #10; $display("Input: A=%b, B=%b, S=%b, Output: O=%b", A, B, S, O);
        A = 1; B = 1; S = 1; #10; $display("Input: A=%b, B=%b, S=%b, Output: O=%b", A, B, S, O);

        // Finish simulation
        $finish;
    end

endmodule
