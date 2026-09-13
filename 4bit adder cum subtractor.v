// design file
module fa(
  input a, b, cin,
  output sum, cout
);
  wire w1, w2, w3, y;

  xor (y, a, b);
  xor x1(sum, y, cin);

  and a1(w1, a, b);
  and a2(w2, a, cin);
  and a3(w3, b, cin);

  or o1(cout, w1, w2, w3);
endmodule


module adder_subtractor_4bit(
  input [3:0] a, b,
  input mode,
  output [3:0] result,
  output cout
);

  wire c1, c2, c3;
  wire [3:0] bx;

  // XOR B with mode
  xor x0(bx[0], b[0], mode);
  xor x1(bx[1], b[1], mode);
  xor x2(bx[2], b[2], mode);
  xor x3(bx[3], b[3], mode);

  // Ripple Carry Adder
  fa f0(a[0], bx[0], mode, result[0], c1);
  fa f1(a[1], bx[1], c1,   result[1], c2);
  fa f2(a[2], bx[2], c2,   result[2], c3);
  fa f3(a[3], bx[3], c3,   result[3], cout);

endmodule

// test bench
module tb_adder_subtractor_4bit;

  reg [3:0] a, b;
  reg mode;
  wire [3:0] result;
  wire cout;

  // Instantiate DUT
  adder_subtractor_4bit uut (
    .a(a),
    .b(b),
    .mode(mode),
    .result(result),
    .cout(cout)
  );

  // VCD dump
  initial begin
    $dumpfile("adder_subtractor_4bit.vcd");
    $dumpvars(0, tb_adder_subtractor_4bit);
  end

  initial begin

    // ADDITION: mode = 0

    a = 4'b0101;
    b = 4'b0011;
    mode = 1'b0;
    #10;

    a = 4'b1010;
    b = 4'b0011;
    mode = 1'b0;
    #10;

    a = 4'b1111;
    b = 4'b0001;
    mode = 1'b0;
    #10;


    // SUBTRACTION: mode = 1

    a = 4'b0101;
    b = 4'b0011;
    mode = 1'b1;
    #10;

    a = 4'b1010;
    b = 4'b0011;
    mode = 1'b1;
    #10;

    a = 4'b1001;
    b = 4'b0101;
    mode = 1'b1;
    #10;

    $finish;
  end


endmodule

