`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2023 08:38:23 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb
#( parameter C_OPERAND_WIDTH = 3)
( );
    
    reg [2:0] a,b;
    wire co;
    wire [2:0] sum;
    
    reg iclk = 0;
    reg [3:0] CHECK;
    wire [C_OPERAND_WIDTH : 0] r;
    adder_3 add_3(a,b,sum,co);
    adder_pipeline #(3) ppa(a, b, iclk, r ) ;
    
    integer i, j;
    
    initial begin
        for (i = 0; i <= 200; i = i + 1) begin
            for (j = 0; j <= 200; j = j + 1) begin
                #100 a = $urandom; b = $urandom;
            end
        end
        repeat(C_OPERAND_WIDTH) #100;
        $stop;
    end
    
    always #50 iclk = ~iclk;
    
    always @(posedge iclk)
	begin	
	   CHECK  <= #(100 * (C_OPERAND_WIDTH - 2)) a + b;
	end
    
 
    
    always @(posedge iclk) begin
	#5;
	 if (CHECK != r)
	  $stop;
	end
    
endmodule
