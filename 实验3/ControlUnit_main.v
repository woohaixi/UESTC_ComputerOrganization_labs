`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:33 08/04/2024 
// Design Name: 
// Module Name:    ControlUnit_main 
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
module ControlUnit_main(OP, RegWr, ALUSrc, RegDst, 
                        MemtoReg, MemWr, Branch, Jump,
								ExtOp, ALUop, R_type
    );
	 input [5:0] OP;		//OP-ָ�����ͱ��룻
	 output RegWr;			//RegWr-�Ĵ���д�źţ�
	 output ALUSrc;		//ALUSrc-ѡ��ALU�ڶ�����������
	 output RegDst;		//RegDst-ѡ��Ŀ�ļĴ�����
	 output MemtoReg;		//MemtoReg-ѡ��д��Ĵ��������ݣ�
	 output MemWr;			//MemWr-�洢��д�źţ�
	 output Branch;		//Branch-����ת��ָ���ж��źţ�
	 output Jump;			//Jump-������ת��ָ���ж��źţ�
	 output ExtOp;			//ExtOp-ѡ����з�����չ��������չ��
	 output [2:0] ALUop;			//ALUop-��R_typeָ��ʱ����ָ�����͸���ALU�����źţ�
	 output R_type;		//R_type-�жϵ�ǰָ���Ƿ�ΪR_typeָ�
	 
	 wire ori = !OP[5] & !OP[4] & OP[3] & OP[2] & !OP[1] & OP[0];			//ori-OP=6'b001101��
	 wire addiu = !OP[5] & !OP[4] & OP[3] & !OP[2] & !OP[1] & OP[0];		//addiu-OP=6'b001001��
	 wire lw = OP[5] & !OP[4] & !OP[3] & !OP[2] & OP[1] & OP[0];			//lw-OP=6'b100011��
	 wire sw = OP[5] & !OP[4] & OP[3] & !OP[2] & OP[1] & OP[0];			//sw-OP=6'b101011��
	 wire beq = !OP[5] & !OP[4] & !OP[3] & OP[2] & !OP[1] & !OP[0];			//beq-OP=6'b000100��
	 wire jump = !OP[5] & !OP[4] & !OP[3] & !OP[2] & OP[1] & !OP[0];			//jump-OP=6'b000010��
	 
	 assign RegWr = R_type | ori | addiu | lw;
	 assign ALUSrc = ori | addiu | lw | sw;
	 assign RegDst = R_type;
	 assign MemtoReg = lw;
	 assign MemWr = sw;
	 assign Branch = beq;
	 assign Jump = jump;
	 assign ExtOp = addiu | lw | sw;
	 assign ALUop[0] = R_type;
	 assign ALUop[1] = ori;
	 assign ALUop[2] = beq;
	 assign R_type = !OP[5] & !OP[4] & !OP[3] & !OP[2] & !OP[1] & !OP[0];

endmodule
