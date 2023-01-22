`timescale 1ns / 1ps
//------------------------------------------
//              | |                         |Project name: adder_3
//==============+=+==============           |Developer: KeisN13
//              | |            ||           |
//    |***|    |***|           ||           |Description:
//====|***|    |***|           \\ |***|     |3-bit adder
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



module adder_3(
    input [2:0] a, b,
    output [2:0] sum,
    output co
);

    wire [2:0] wco;

    fulladder fa0(a[0], b[0], 0, sum[0], wco[0]);
    fulladder fa1(a[1], b[1], wco[0], sum[1], wco[1]);
    fulladder fa2(a[2], b[2], wco[1], sum[2], wco[2]);

    assign co = wco[2];
endmodule
