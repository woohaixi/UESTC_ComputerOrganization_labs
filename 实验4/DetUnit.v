`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:05 11/30/2024 
// Design Name: 
// Module Name:    DetUnit 
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
module DetUnit(E_Rs, E_Rt, E_ALUSrc, M_Rw, W_Rw, M_RegWr, W_RegWr,
               ALUSrcA, ALUSrcB
    );
	 input [4:0] E_Rs;		//E_Rs-Ex��ָ��ĵ�һ���Ĵ�����������
	 input [4:0] E_Rt;		//E_Rt-Ex��ָ��ĵڶ����Ĵ�����������
	 input [4:0] M_Rw;		//M_Rw-Mem��ָ���д�Ĵ�����ַ��
	 input [4:0] W_Rw;		//W_Rw-Wr��ָ���д�Ĵ�����ַ��
	 input E_ALUSrc;		//E_ALUSrc-Ex��ָ��ڶ���ALU��������ѡ���źţ�
	 input M_RegWr;		//M_RegWr-Mem��ָ��Ĵ���д��־��
	 input W_RegWr;		//W_RegWr-Wr��ָ��Ĵ���д��־
	 output [1:0] ALUSrcA;		//ALUSrcA-Ex������ǰ��ͨ·��ALU��һ��������������ѡ���źţ�
	 output [1:0] ALUSrcB;		//ALUSrcB-Ex������ǰ��ͨ·��ALU�ڶ���������������ѡ���źţ�
	 
	 wire C1A = M_RegWr && (M_Rw == E_Rs);		//C1A-Ex��ָ��ĵ�һ��ALU��������Mem����д�Ĵ������ݼ��������ð�գ�
	 wire C1B = M_RegWr && (M_Rw == E_Rt);		//C1B-Ex��ָ��ĵڶ���ALU��������Mem����д�Ĵ������ݼ��������ð�գ�
	 wire C2A = W_RegWr && (W_Rw == E_Rs);		//C2A-Ex��ָ��ĵ�һ��ALU��������Wr����д�Ĵ������ݼ��������ð�գ�
	 wire C2B = W_RegWr && (W_Rw == E_Rt);		//C2B-Ex��ָ��ĵڶ���ALU��������Wr����д�Ĵ������ݼ��������ð�գ�
	 
	 assign ALUSrcA = C1A ? 2'b01 : 
	                  C2A ? 2'b10 : 2'b00;
	 assign ALUSrcB = E_ALUSrc ? 2'b11 :
	                  C1B ? 2'b01 : 
							C2B ? 2'b10 : 2'b00;

endmodule
