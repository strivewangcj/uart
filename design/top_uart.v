`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE     
// VSCODE plug-in version: Verilog-Hdl-Format-2.8.20240817
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            Please Write Company name
// All rights reserved     
// File name:              
// Last modified Date:     2025/01/14 17:38:01
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name 
// Created date:           2025/01/14 17:38:01
// mail      :             Please Write mail 
// Version:                V1.0
// TEXT NAME:              top_uart.v
// PATH:                   C:\Users\12614\Desktop\prj\uart\design\top_uart.v
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module top_uart(
    input                               clk                        ,
    input                               rst_n                      ,
    input               rx,
    output tx
);
                                                                   
localparam clk_frequence = 50_000_000 ;
localparam baud_rate = 9600;
wire [7:0]  po_data;
wire po_flag;

uart_rx # (
    .clk_frequence(clk_frequence),
    .baud_rate(baud_rate)
  )
  uart_rx_inst (
    .clk(clk),
    .rst_n(rst_n),
    .rx(rx),
    .po_data(po_data),
    .po_flag(po_flag)
  );


  uart_tx # (
    .clk_frequence(clk_frequence),
    .baud_rate(baud_rate)
  )
  uart_tx_inst (
    .clk(clk),
    .rst_n(rst_n),
    .pi_data(po_data),
    .pi_flag(po_flag),
    .tx(tx)
  );
endmodule