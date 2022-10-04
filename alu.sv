module alu(input [31:0] a,b,
 input [2:0] f,
 output reg  [31:0] y,
 output reg zero); 
 
 wire signed [31:0] a1,b1;
 reg signed [31:0] temp ;

 assign a1 = a;
 assign b1 = b;
 
 always@ (*)
 begin
 case (f)
 0:
	y = a & b;
 1:
	y = a | b;
 2:
	y = a1 + b1;
 6:
	y = a1 + (-b1);
 7:begin
	if(a1 < b1)
		y = 1;
	else 
		y = 0;
 end
 default:
	y = 0;

 endcase

 
 if(y == 0)
 assign zero = 1;
 else
 assign zero = 0;
 end
 
 endmodule
