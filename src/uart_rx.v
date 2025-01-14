`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/12 15:18:58
// Design Name: 
// Module Name: uart_rx
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


module uart_rx#(
    parameter                                                            P_SYSTEM_CLK                 = 50_000_000,
    parameter                                                            P_UART_BUADRATE              = 9600  ,
    parameter                                                            P_UART_DATAWIDTH             = 8     ,
    parameter                                                            P_UART_STOPWIDTH             = 1     
  )(
    input                                                                i_clk                         ,
    input                                                                i_rst                         ,
    input                                                                i_uart_rx                     ,
    input                                                                o_user_rx_data                ,
    input                                                                o_user_rx_valid                
  );
endmodule
