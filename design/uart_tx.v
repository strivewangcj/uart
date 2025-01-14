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
// Last modified Date:     2025/01/14 16:33:05
// Last Version:           V1.0
// Descriptions:
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name
// Created date:           2025/01/14 16:33:05
// mail      :             Please Write mail
// Version:                V1.0
// TEXT NAME:              uart_tx.v
// PATH:                   C:\Users\12614\Desktop\prj\uart\design\uart_tx.v
// Descriptions:
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module uart_tx#(
    parameter clk_frequence = 5_000_000,
    parameter baud_rate = 9600
  )(
    input                               clk                        ,
    input                               rst_n              ,
    input      [7:0]     pi_data,
    input           pi_flag,
    output      reg         tx
  );

  parameter cnt_baud_max = clk_frequence/baud_rate;
  parameter cnt_baud_width = $clog2(cnt_baud_max);

  reg [7:0] data_reg;
  reg   tx_flag;

  reg [cnt_baud_width-1:0]    cnt_baud;
  reg [3:0]                   bit_cnt;
  reg                         bit_flag;

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      data_reg <= 8'd0;
    else if(pi_flag)
      data_reg <= pi_data;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      tx_flag <= 1'b0;
    else if(bit_cnt == 8 && bit_flag)
      tx_flag <= 1'b0;
    else if(pi_flag)
      tx_flag <= 1'b1;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      cnt_baud <= 'd0;
    else if(cnt_baud == cnt_baud_max)
      cnt_baud <= 0;
    else if(tx_flag)
      cnt_baud <= cnt_baud + 1;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      bit_cnt <= 'd0;
    else if(bit_cnt == 8 && bit_flag)
      bit_cnt <= 'd0;
    else if(bit_flag)
      bit_cnt <= bit_cnt + 1;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      bit_flag <= 1'b0;
    else if(tx_flag && cnt_baud == cnt_baud_max - 1 )
      bit_flag <= 1'b1;
    else
      bit_flag <= 1'b0;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      tx <= 1'b1;
    else if(pi_flag)
      tx <= 1'b0;
    else if(bit_cnt == 8 && bit_flag)
      tx <= 1'b1;
    else if(bit_flag)
      tx <= data_reg[bit_cnt];
  end
endmodule
