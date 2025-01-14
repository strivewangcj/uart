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
// Last modified Date:     2025/01/14 11:23:17
// Last Version:           V1.0
// Descriptions:
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name
// Created date:           2025/01/14 11:23:17
// mail      :             Please Write mail
// Version:                V1.0
// TEXT NAME:              uart_rx.v
// PATH:                   C:\Users\12614\Desktop\prj\uart\design\uart_rx.v
// Descriptions:
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module uart_rx(
    input                               clk                        ,
    input                               rst_n                     ,
    input rx,
    output reg [7:0] po_data,
    output reg po_flag
  );
  parameter baud_rate = 9600;
  parameter cnt_width = $clog(baud_rate);

  reg rx1;
  reg rx2;
  reg rx2_reg;

  reg rx_flag;
  reg [cnt_width-1:0] cnt_baud;
  reg [3:0] bit_cnt;
  reg      bit_flag;
  //   always @(posedge clk or negedge rst_n)
  //   begin
  //     if(!rst_n)
  //     begin
  //       rx1 <= 0 ;
  //       rx2 <= 0 ;
  //       rx2_reg <= 0;
  //     end
  //     else
  //     begin
  //       rx1 <= rx ;
  //       rx2 <= rx1 ;
  //       rx2_reg <= rx2;
  //     end
  //   end

  always @(posedge clk)
  begin
    {rx2_reg,rx2,rx1} <= {rx2,rx1,rx};
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      bit_flag <= 1'b0;
    else if(rx_flag == 1 && cnt_baud == (baud_rate/2))
      bit_flag <= 1'b1;
    else
      bit_flag <= 1'b0;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      bit_cnt <= 'b0;
    else if(bit_cnt == 8)
      bit_cnt <= 'd0;
    else if(bit_flag)
      bit_cnt <= bit_cnt + 1;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      rx_flag <= 1'b0;
    else if(bit_cnt == 8 && bit_flag == 1)
      rx_flag <= 1'b0;
    else if(rx2_reg == 1 && rx2 == 0)
      rx_flag <= 1'b1;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      cnt_baud <= 'b0;
    else if (cnt_baud == baud_rate)
      cnt_baud <= 'b0;
    else if(bit_cnt == 8 && bit_flag)
      cnt_baud <= 'b0;
    else if(rx_flag)
      cnt_baud <= cnt_baud + 1 ;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      po_data <=  'b0;
    else if (bit_cnt == 8 &&  bit_flag == 1)
      po_data <= 'b0;
    else if(bit_flag)
      po_data <= {po_data[7:0],rx2_reg};
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      po_flag <= 'b0;
    else if(bit_flag == 1 && bit_cnt == 8)
      po_flag <= 1'b1;
    else
      po_flag <= 1'b0;
  end
endmodule
