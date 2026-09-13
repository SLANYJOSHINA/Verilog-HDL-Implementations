// design code
module mux2x1(
    input d0,
    input d1,
    input sel,
    output y
);

assign y = sel ? d1 : d0;

endmodule
// Test bench 
module mux2x1_tb;

reg d0, d1, sel;
wire y;

mux2x1 DUT (.d0(d0), .d1(d1), .sel(sel), .y(y));

initial begin
    $dumpfile("mux2x1.vcd");
    $dumpvars(0, mux2x1_tb);

    d0=0; d1=1; sel=0;
    #10 sel=1;
    #10 d0=1; d1=0; sel=0;
    #10 sel=1;
    #10 $finish;
end


endmodule
