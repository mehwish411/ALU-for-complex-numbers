module arithmetic (
input clk,
input [15:0] a, b,
input [15:0] c, d,
output reg [15:0] y, z,
output reg [15:0] w, x
);

reg [31:0] ac, bd, ad, bc;
//Intermediate products 

always @(posedge clk) begin
ac <= a* c;
bd <= b* d;
ad <= a* d;
bc <= b* c;
end

//Final addition/subtraction 

always @(posedge clk) begin

y <= ac-bd;   // Real part of multiplication
z <= ad + bc;  // Imaginary  part of multiplication

// Addition result: (a + bi) + (c + di) = (a+c) + (b + d) 

w <= a + c; //real part
x <= b+d;   //imaginary part

end

endmodule

module arithmetic_optimized (
input clk,

input [15:0] a, b,
input [15:0] c, d,
output reg [15:0] y, z,
output reg [15:0] w, x
);
reg [31:0] s1, s2, s3;
reg [31:0] m,n;
always @(posedge clk) begin

s1 <= c *(a + b);
s2 <= a *(d - c);
s3 <= b *(c + d);
end
always @(posedge clk) begin
m <= s1 + s2;
n <= s1 -s3;
y <= n;    // Real part of multiplication
z <= m;   // Imaginary part of multiplication
// Addition result: (a + bi) + (c + di) = (a+c) + (b + d) i
w <= a+c;   // Real part of addition
x <= b+d;   // Imaginary part of addition
end

endmodule

module tb_arithmetic;

reg clk;
reg [15:0] a, b, c, d;
wire [15:0] y_4, z_4, w_4, x_4; // Outputs for 4-multiplier module
wire [15:0] y_3, z_3, w_3, x_3; // Outputs for 3-multiplier module
arithmetic uut (.clk(clk), .a(a), .b(b), .c(c), .d(d), .y(y_4), .z(z_4), .w(w_4), .x(x_4)); 
arithmetic_optimized uut_1 (.clk(clk), .a(a), .b(b), .c(c), .d(d), .y(y_3), .z(z_3), .w(w_3), .x(x_3));
initial begin
clk = 0;
forever #5 clk= ~clk;
end
initial begin

a = 16'd3; b =16'd4; // (3+4i)
c = 16'd8; d =16'd9; // (8 + 9i)  
#100;

a = 16'd2; b = 16'd4; // (2+4i) 
c = -16'd6; d =-16'd3; // (-6-3i)

#100;
a = -16'd1; b = 16'd9;// (-1+9i) 
c = 16'd5; d =16'd2; // (5+2i)

#100;
a = -16'd7; b = 16'd3; // (-7+3i) 
c = 16'd9; d =16'd1; // (9+1i)

#100;
$stop;

end

endmodule
