// Creator: Junhwan Lee
// Date: 10/03/2022
// 32 Bit ALU
// 154A

module alu(input [31:0] a,b,
 input [2:0] f,
 output reg  [31:0] y,
 output reg zero); 
 
 // Declare signed variables
 wire signed [31:0] a1,b1;
 
 // Copy the values of unsigned bits to signed bits
 assign a1 = a;
 assign b1 = b;
 
 always@ (*)
 begin
 // MUX created using the case - statement
 case (f)
 0:
	y = a & b; // A AND B
 1:
	y = a | b; // A OR B
 2:
	y = a1 + b1; // A + B
 6:
	 y = a1 + (-b1); // A - B
 7:begin
	 if(a1 < b1) // Set Less Than
		y = 1;
	else 
		y = 0;
 end
 default:
	y = 0;

 endcase

 // Flag set to 1 if output is 0
 if(y == 0)
 assign zero = 1;
 else
 assign zero = 0;
 end
 
 endmodule
 // End of code
