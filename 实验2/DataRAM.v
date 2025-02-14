`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:11:00 07/29/2024 
// Design Name: 
// Module Name:    DataRAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DataRAM(CLK, DataIn, WE, Address, DataOut
    );
	 input CLK, WE;		//CLK-ʱ���źţ� WE-д����ʹ���źţ�
	 input [31:0] DataIn, Address;		//DataIn-д���������źţ� Address-��д��ַ�ź�
	 output [31:0] DataOut;		//DataOut-����������źţ�
	 
	 reg [31:0] RAM [31:0];		//RAM-�洢�����齨ģ��
	 
	 always @ (negedge CLK)
	   if(WE) RAM[Address[4:0]] <= DataIn;		//д������
		
	 assign DataOut = RAM[Address[4:0]];		//��������
	 
	 integer i;		//�洢����ʼ����
	 initial 
	   begin
		  for (i = 0; i < 32; i = i + 1)
		    RAM[i] = 32'h80000000 + i;
	   end
	 
endmodule
