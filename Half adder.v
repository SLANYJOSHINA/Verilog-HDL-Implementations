// Design file
module fa(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule
//test bench
module fa_tb;

reg a, b, cin;
wire sum, cout;

fa DUT (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

initial begin
    $dumpfile("fa.vcd");  // to be used in EDA playground
    $dumpvars(0, fa_tb);

    a=0; b=0; cin=0;
    #10 a=0; b=1; cin=0;
    #10 a=1; b=0; cin=1;
    #10 a=1; b=1; cin=0;
    #10 a=1; b=1; cin=1;
    #10 $finish;
end



endmodule
