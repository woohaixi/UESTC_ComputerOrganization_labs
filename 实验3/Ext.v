`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:42 08/04/2024 
// Design Name: 
// Module Name:    Ext 
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
module Ext(imm16, ExtOp, Extout
    );
	 input [15:0] imm16;			//imm16-16λ���������룻
	 input ExtOp;					//ExtOp-1:��������չ��0��������չ��
	 output [31:0] Extout;		//Extout-��չ���32λ���������
	 
	 assign Extout = ExtOp ? {{16{imm16[15]}}, imm16} : {16'h0000, imm16};

endmodule
