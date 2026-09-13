// design file
module decoder2x4(
    input [1:0] in,
    output [3:0] out
);

assign out[0] = ~in[1] & ~in[0];
assign out[1] = ~in[1] &  in[0];
assign out[2] =  in[1] & ~in[0];
assign out[3] =  in[1] &  in[0];

endmodule

//test bench code
module decoder2x4_tb;

reg [1:0] in;
wire [3:0] out;

decoder2x4 DUT (.in(in), .out(out));

initial begin
    $dumpfile("decoder2x4.vcd");
    $dumpvars(0, decoder2x4_tb);

    in=2'b00;
    #10 in=2'b01;
    #10 in=2'b10;
    #10 in=2'b11;
    #10 $finish;
end


endmodule
