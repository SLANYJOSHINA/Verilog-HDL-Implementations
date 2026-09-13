// design file
module fs(
    input a,
    input b,
    input bin,
    output diff,
    output bout
);

assign diff = a ^ b ^ bin;
assign bout = (~a & b) | (~(a ^ b) & bin);

endmodule
// Test bench 
module fs_tb;

reg a, b, bin;
wire diff, bout;

fs DUT (.a(a), .b(b), .bin(bin), .diff(diff), .bout(bout));

initial begin
    $dumpfile("fs.vcd");
    $dumpvars(0, fs_tb);

    a=0; b=0; bin=0;
    #10 a=0; b=1; bin=0;
    #10 a=1; b=0; bin=1;
    #10 a=1; b=1; bin=0;
    #10 a=1; b=1; bin=1;
    #10 $finish;
end


endmodule
