// design file
module fa(
  input a,b,cin,
  output sum,cout
);
  wire w1,w2,w3,y;
  xor (y,a,b);
  xor x1(sum,y,cin);
  and a1(w1,a,b);
  and a2(w2,a,cin);
  and a3(w3,b,cin);
  or o1(cout,w1,w2,w3);
endmodule
module rca_4bit(
  input [3:0]a,b,
  input cin,
  output [3:0] sum,
  output cout
);
  wire c1,c2,c3;
  fa f0(a[0],b[0],cin,sum[0],c1);
  fa f1(a[1],b[1],c1,sum[1],c2);
  fa f2(a[2],b[2],c2,sum[2],c3);
  fa f3(a[3],b[3],c3,sum[3],cout);
endmodule
// test bench file
module tb_rca_4bit;

  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  // Instantiate the DUT
  rca_4bit dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    $dumpfile("rca_4bit.vcd");
    $dumpvars(0, tb_rca_4bit);

    // Test case 1
    a = 4'b0000;
    b = 4'b0000;
    cin = 1'b0;
    #10;

    // Test case 2
    a = 4'b0011;
    b = 4'b0101;
    cin = 1'b0;
    #10;

    // Test case 3
    a = 4'b1010;
    b = 4'b0011;
    cin = 1'b0;
    #10;

    // Test case 4
    a = 4'b1111;
    b = 4'b0001;
    cin = 1'b0;
    #10;

    // Test case 5 - carry input
    a = 4'b0101;
    b = 4'b0011;
    cin = 1'b1;
    #10;

    // Test case 6 - maximum value
    a = 4'b1111;
    b = 4'b1111;
    cin = 1'b0;
    #10;

    $finish;
  end


endmodule
