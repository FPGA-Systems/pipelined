`timescale 1ns / 1ps
//------------------------------------------
//              | |                         |Project name: adder_pipeline
//==============+=+==============           |Developer: KeisN13
//              | |            ||           |
//    |***|    |***|           ||           |Description:
//====|***|    |***|           \\ |***|     |Fully pipelined adder
//====|***|    |***|             =|***|==== |Synth with 1 level of logic
//====|***|====|***|    |**\                |Pipelined carry chain
//====|***|    |***|====|***\     |***|     |Latecy = operand width - 2
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


module adder_pipeline
#( parameter C_OPERAND_WIDTH = 64)
(
    input [C_OPERAND_WIDTH - 1 : 0] a, b,
    input iclk,
    output [C_OPERAND_WIDTH : 0] r
);


   wire [C_OPERAND_WIDTH - 1 : 0] sum, co, co_dff, a_dff, b_dff, sum_dff ;

   fulladder fa_0 (a[0], b[0], 0, sum[0], co[0]);
   delay #(C_OPERAND_WIDTH-1) delay_sum0(sum[0],iclk,r[0]);
   delay #(1)                 deleay_co0(co[0], iclk, co_dff[0]);

   genvar i, k;
   generate
      for (i=1; i < C_OPERAND_WIDTH - 1 ; i=i+1)
      begin: fa

         delay #(i) delya_a(a[i], iclk, a_dff[i]);
         delay #(i) delya_b(b[i], iclk, b_dff[i]);

         fulladder fa (a_dff[i], b_dff[i], co_dff[i-1], sum[i], co[i]);

         delay #(C_OPERAND_WIDTH - i - 1) delay_sum(sum[i], iclk, r[i]);
         delay #(1) delay_co(co[i], iclk, co_dff[i]);
      end

   endgenerate

    delay#(C_OPERAND_WIDTH - 1) delay_a_last (a[C_OPERAND_WIDTH - 1], iclk, a_dff[C_OPERAND_WIDTH - 1]);
    delay#(C_OPERAND_WIDTH - 1) delay_b_last (b[C_OPERAND_WIDTH - 1], iclk, b_dff[C_OPERAND_WIDTH - 1]);

    fulladder fa_last(a_dff[C_OPERAND_WIDTH - 1], b_dff[C_OPERAND_WIDTH - 1], co_dff[C_OPERAND_WIDTH - 2], r[C_OPERAND_WIDTH - 1], r[C_OPERAND_WIDTH]);


endmodule
