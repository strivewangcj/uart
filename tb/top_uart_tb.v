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
// Last modified Date:     2025/01/14 17:47:06
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name 
// Created date:           2025/01/14 17:47:06
// mail      :             Please Write mail 
// Version:                V1.0
// TEXT NAME:              top_uart_tb.v
// PATH:                   C:\Users\12614\Desktop\prj\uart\tb\top_uart_tb.v
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//


module top_uart_tb;

  // Parameters

  //Ports
  reg clk;
  reg rst_n;
  reg rx;
  wire tx;

  top_uart  top_uart_inst (
    .clk(clk),
    .rst_n(rst_n),
    .rx(rx),
    .tx(tx)
  );

//always #5  clk = ! clk ;

endmodule