`timescale 1ns / 1ps
//------------------------------------------
//              | |                         |Project name: adder
//==============+=+==============           |Developer: KeisN13
//              | |            ||           |
//    |***|    |***|           ||           |Description:
//====|***|    |***|           \\ |***|     |Parametrized operand width adder
//====|***|    |***|             =|***|==== |Used for comparison to adder_papeline
//====|***|====|***|    |**\                |in speed and resources
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


module adder
#( parameter C_OPERAND_WIDTH = 64)
(
    input [C_OPERAND_WIDTH - 1 : 0] a, b,
    input iclk,
    output reg [C_OPERAND_WIDTH : 0] r
);
reg [C_OPERAND_WIDTH : 0] r_i;
reg [C_OPERAND_WIDTH - 1 : 0] a_i, b_i;

always @(posedge iclk)
begin
  a_i <= a;
  b_i <= b;
  r <= a_i + b_i;
  
end
endmodule
