`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:44 07/31/2024 
// Design Name: 
// Module Name:    FA 
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
module FA(X, Y, C, F, G, P
    );
	 input X, Y;		//X-�������� Y-������
	 input C;		//C-��λ���룻
	 output F;		//F-�����
	 output G, P;		//G-��λ���ɺ����� P-��λ���ݺ�����
	 
	 assign F = X ^ Y ^ C;
	 assign G = X & Y;
	 assign P = X + Y;

endmodule
