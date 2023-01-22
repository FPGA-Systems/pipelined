`timescale 1ns / 1ps
//------------------------------------------
//              | |                         |Project name: top
//==============+=+==============           |Developer: KeisN13
//              | |            ||           |
//    |***|    |***|           ||           |Description:
//====|***|    |***|           \\ |***|     |Wrapper for adder_pipeline with I/O registers
//====|***|    |***|             =|***|==== |
//====|***|====|***|    |**\                |
//====|***|    |***|====|***\     |***|     |
//    |***|    |***|    |****|====|***|==== |
//             |***|    |****|    FPGA      |
//fpga-systems |***| ru |****| developers   |support and more FPGA content https://boosty.to/fpgasystems
//             |***|    |****|  community   |
//    |***|    |***|    |****|====|***|==== |Video record placed here https://youtu.be/RmTfinxCfT4
//====|***|    |***|====|***/     |***|     |
//====|***|====|***|    |**/                |
//====|***|    |***|             =|***|==== |
//====|***|    |***|           // |***|     |
//    |***|    |***|           ||           |
//              | |            ||           |web      - https://fpga-systems.ru
//==============+=+==============           |telegram - https://t.me/fpgasystems
//              | |                         |Youtube  - https://www.youtube.com/c/fpgasystems
//------------------------------------------


module top
#( parameter C_OPERAND_WIDTH = 64)
(
    input [C_OPERAND_WIDTH - 1 : 0] a, b,
    input iclk,
    output reg [C_OPERAND_WIDTH : 0] r
);
wire [C_OPERAND_WIDTH : 0] r_i;
reg [C_OPERAND_WIDTH - 1 : 0] a_i, b_i;

always @(posedge iclk)
begin
  a_i <= a;
  b_i <= b;
  r <= r_i;

end

    adder_pipeline #(64) ppa(a_i, b_i, iclk, r_i ) ;


endmodule
