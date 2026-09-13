//Design code
module ha(
    input  a,
    input  b,
    output sum,
output carry
);

assign sum = a ^ b;
assign carry = a & b;


endmodule
//Test bench code
module ha_tb;

reg a, b;
wire sum;
wire carry;


ha DUT (
    .a(a),
    .b(b),
    .sum(sum)
.carry(carry)
);

initial begin

  $dumpfile("ha.vcd");// used in EDA playground
    $dumpvars(0, ha_tb);

    a = 0;
    b = 0;

    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;

    #10 $finish;

end

endmodule

