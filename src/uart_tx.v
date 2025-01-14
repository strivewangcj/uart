`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/12 15:18:58
// Design Name: 
// Module Name: uart_tx
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


module uart_tx#(
    parameter                                                            P_SYSTEM_CLK                 = 50_000_000,
    parameter                                                            P_UART_BUADRATE              = 9600  ,
    parameter                                                            P_UART_DATAWIDTH             = 8     ,
    parameter                                                            P_UART_STOPWIDTH             = 1     
  )(
    input                                                                i_clk                         ,
    input                                                                i_rst                         ,
    output                                                               o_uart_tx                     ,
    input              [P_UART_DATAWIDTH - 1:               0]           i_user_tx_data                ,
    input                                                                i_uart_tx_valid               ,
    output                                                               o_user_tx_ready               
  );
endmodule
