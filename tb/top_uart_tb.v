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

  reg [4:0] mem [15:0];
  top_uart  top_uart_inst (
    .clk(clk),
    .rst_n(rst_n),
    .rx(rx),
    .tx(tx)
  );
initial begin
  clk = 0;
  rst_n = 0;
  #100
  rst_n = 1;
end

always #10  clk = ! clk ;

initial begin
  rx = 1;
  #200;
  rx_byte();
end

initial begin
  $readmemh("../data/data.txt",mem);
end

task rx_byte();
  integer i;
  begin
    for(i=0;i<16;i=i+1)//不能使用i++
    begin 
      rx_bit(mem[i]);
    end
  end
endtask

task rx_bit(input [7:0] data);
  integer i;
  begin
    for(i=0;i<10;i=i+1)
    begin
      case (i)
        0:rx = 0;
        1:rx = data[i-1];
        2:rx = data[i-1];
        3:rx = data[i-1];
        4:rx = data[i-1];
        5:rx = data[i-1];
        6:rx = data[i-1];
        7:rx = data[i-1];
        8:rx = data[i-1];
        9:rx = 1;
      endcase
      #104160;
    end
  end
endtask

endmodule