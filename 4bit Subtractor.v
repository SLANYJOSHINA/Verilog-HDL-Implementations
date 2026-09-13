// design file
module fs(
  input a, b, bin,
  output diff, bout
);
  wire w1, w2, w3, y;
  xor (y, a, b);
  xor x1(diff, y, bin);
  and a1(w1, ~a, b);
  and a2(w2, ~a, bin);
  and a3(w3, b, bin);
  or o1(bout, w1, w2, w3);
endmodule

module rcs_4bit(
  input [3:0] a, b,
  input bin,
  output [3:0] diff,
  output bout
);
  wire b1, b2, b3;
  fs f0(a[0], b[0], bin, diff[0], b1);
  fs f1(a[1], b[1], b1, diff[1], b2);
  fs f2(a[2], b[2], b2, diff[2], b3);
  fs f3(a[3], b[3], b3, diff[3], bout);
endmodule
// test bench 
module tb_rcs_4bit;

  reg [3:0] a, b;
  reg bin;
  wire [3:0] diff;
  wire bout;

  // Instantiate DUT
  rcs_4bit uut (
    .a(a),
    .b(b),
    .bin(bin),
    .diff(diff),
    .bout(bout)
  );

  // VCD dump
  initial begin
    $dumpfile("rcs_4bit.vcd");
    $dumpvars(0, tb_rcs_4bit);
  end

  // Test cases
  initial begin

    a = 4'b0101;
    b = 4'b0011;
    bin = 1'b0;
    #10;

    a = 4'b1001;
    b = 4'b0011;
    bin = 1'b0;
    #10;

    a = 4'b0011;
    b = 4'b0101;
    bin = 1'b0;
    #10;

    a = 4'b1010;
    b = 4'b0011;
    bin = 1'b1;
    #10;

    a = 4'b1111;
    b = 4'b0001;
    bin = 1'b0;
    #10;

    a = 4'b0000;
    b = 4'b0001;
    bin = 1'b0;
    #10;

    $finish;
  end
endmodule
