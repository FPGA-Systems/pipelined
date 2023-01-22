`timescale 1ns / 1ps
//------------------------------------------
//              | |                         |Project name: delay
//==============+=+==============           |Developer: KeisN13
//              | |            ||           |
//    |***|    |***|           ||           |Description:
//====|***|    |***|           \\ |***|     |1-bit delay line for C_CLOCK_CYCLES cylcles (from 1 to any)
//====|***|    |***|             =|***|==== |or 1-bit shift register
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


module delay
#( parameter C_CLOCK_CYCLES = 1)
(
    input id, iclk,
    output oq
);



    wire data_in;
    wire data_out;


   reg [C_CLOCK_CYCLES-1:0] shift_reg = {C_CLOCK_CYCLES{1'b0}};

    assign data_in = id;

   always @(posedge iclk)
         shift_reg <= {shift_reg[C_CLOCK_CYCLES-1:0], data_in};

   assign oq = shift_reg[C_CLOCK_CYCLES-1];

endmodule
