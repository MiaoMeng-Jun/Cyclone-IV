module top(
    input           clk,

    output [13:0]    dac904e_db,
    output           dac904e_clk
);

parameter CLK_FRE 	= 50; //FPGA 输入MHz


/********************************************************************************/
/**************************      用户逻辑   ************************************/
/********************************************************************************/
wire [13:0] dac904e_data;
dac904e_ctl dac904e_ctl_m0(
    .clk            (dac904e_clk   ),

    .dac904e_data   (dac904e_data   )
);

/********************************************************************************/
/**************************    da9708驱动    ************************************/
/********************************************************************************/
assign dac904e_db    = dac904e_data;
assign dac904e_clk   = clk; //由于DAC clk频率通常较高，一般由PLL单独给出

endmodule