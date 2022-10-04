// Creator: Junhwan Lee
// Date: 10/03/2022
// Test Bench for custom 32 bit ALU
// ECE 154A

module alu_tb();
  reg [31:0] a, b;
  reg [2:0] f;
  wire [31:0] y;
  wire zero;
  
  // Create a test unit for alu
  alu alu_test(.a(a),
    .b(b),
    .f(f),
    .y(y),
    .zero(zero));
  
  // Initialize temporary registers to store values from test vectors
  reg [31:0] a_temp, b_temp;
  reg [2:0] f_temp;
  reg [31:0] y_temp;
  reg zero_temp;
  
  // Declare test vectors
  reg [31:0] testvector [0:104];
  
  // Reade the test vector file
  initial $readmemh("alu.tv", testvector);
  initial begin
    // Store the values from vectors
    for (integer i=0; i < 105; i=i+5) begin
        // Additional space due to the space between values
        f_temp = testvector[i];
        a_temp = testvector[i+1];
        b_temp = testvector[i+2];
        y_temp = testvector[i+3];
        zero_temp = testvector[i+4];
        a = a_temp;
        b = b_temp;
        f = f_temp;
        
        #5;
        // Check if test passed
        if((y_temp == y) && (zero_temp == zero)) begin
          $display("Test %d passed",i/5 + 1);
        end
     end
  end
endmodule
// End of code
