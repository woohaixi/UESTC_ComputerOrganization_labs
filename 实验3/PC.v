`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:31:48 08/04/2024 
// Design Name: 
// Module Name:    PC 
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
module PC(CLK, PCin, PCout
    );
	 input CLK;		//CLK-ʱ���źţ�
	 input [31:0] PCin;	//PCin-������������룻
	 output [31:0] PCout;	//PCout-��������������
	 
	 reg [31:0] PC = 32'h00000000;
	 
	 always @ (negedge CLK)
	   PC <= PCin;
		
	 assign PCout = PC;	  

endmodule
