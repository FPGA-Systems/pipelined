`timescale 1ns / 1ps
//------------------------------------------
//              | |                         |Project name: fulladder
//==============+=+==============           |Developer: KeisN13
//              | |            ||           |
//    |***|    |***|           ||           |Description:
//====|***|    |***|           \\ |***|     |Simple full adder
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

module fulladder(
    input  ia, ib, ic,
    output  osum, oc
);

    assign osum  = (ia ^ ib) ^ ic;

    assign oc = (ia & ib) | (ib & ic) | (ic & ia);

endmodule
