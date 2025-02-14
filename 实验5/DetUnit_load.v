`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:59 12/01/2024 
// Design Name: 
// Module Name:    DetUnit_load 
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
module DetUnit_load(E_MemtoReg, Rs, Rt, E_Rt, load_use
    );
	 input E_MemtoReg;				//E_MemtoReg-Ex��ָ���MemtoReg�źţ���ʾEx����ָ���Ƿ�Ϊlwָ�
	 input [4:0] Rs;				//Rs-ID��ָ��ĵ�һ���Ĵ�����������
	 input [4:0] Rt;				//Rs-ID��ָ��ĵڶ����Ĵ�����������
	 input [4:0] E_Rt;			//E_Rt-Ex��ָ��ĵڶ����Ĵ�����������
	 output load_use;			//load_use-load-use����ð�ձ�־��
	 
	 assign load_use = E_MemtoReg && ((E_Rt == Rs) || (E_Rt == Rt));

endmodule
