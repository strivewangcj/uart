`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/12 15:18:58
// Design Name: 
// Module Name: uart_drive
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


module uart_drive
#(
  parameter                                                            P_SYSTEM_CLK                 = 50_000_000,
  parameter                                                            P_UART_BUADRATE              = 9600  ,
  parameter                                                            P_UART_DATAWIDTH             = 8     ,
  parameter                                                            P_UART_STOPWIDTH             = 1     
)(
  input                                                                i_clk                         ,
  input                                                                i_rst                         ,

  input                                                                i_uart_rx                     ,
  output                                                               o_uart_tx                     ,

  input              [P_UART_DATAWIDTH - 1:               0]           i_user_tx_data                ,
  input                                                                i_uart_tx_valid               ,
  output                                                               o_user_tx_ready               ,

  input                                                                o_user_rx_data                ,
  input                                                                o_user_rx_valid                
);


  uart_tx # (
  .P_SYSTEM_CLK                                                        (P_SYSTEM_CLK                 ),
  .P_UART_BUADRATE                                                     (P_UART_BUADRATE              ),
  .P_UART_DATAWIDTH                                                    (P_UART_DATAWIDTH             ),
  .P_UART_STOPWIDTH                                                    (P_UART_STOPWIDTH             ) 
  )
  uart_tx_inst (
  .i_clk                                                               (i_clk                        ),
  .i_rst                                                               (i_rst                        ),
  .o_uart_tx                                                           (o_uart_tx                    ),
  .i_user_tx_data                                                      (i_user_tx_data               ),
  .i_uart_tx_valid                                                     (i_uart_tx_valid              ),
  .o_user_tx_ready                                                     (o_user_tx_ready              ) 
  );

  uart_rx # (
  .P_SYSTEM_CLK                                                        (P_SYSTEM_CLK                 ),
  .P_UART_BUADRATE                                                     (P_UART_BUADRATE              ),
  .P_UART_DATAWIDTH                                                    (P_UART_DATAWIDTH             ),
  .P_UART_STOPWIDTH                                                    (P_UART_STOPWIDTH             ) 
  )
  uart_rx_inst (
  .i_clk                                                               (i_clk                        ),
  .i_rst                                                               (i_rst                        ),
  .i_uart_rx                                                           (i_uart_rx                    ),
  .o_user_rx_data                                                      (o_user_rx_data               ),
  .o_user_rx_valid                                                     (o_user_rx_valid              ) 
  );


endmodule
