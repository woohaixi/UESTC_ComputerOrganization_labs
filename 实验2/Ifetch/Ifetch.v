`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:50 08/04/2024 
// Design Name: 
// Module Name:    Ifetch 
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
module Ifetch(CLK, Jump, Branch, Zero, imm16, INST, ADDR
    );
	 input CLK;			//CLK-ʱ���źţ�
	 input Jump;		//Jump-������ת���źţ�
	 input Branch;		//Branch-����ת���źţ�
	 input Zero;		//Zero-�ӷ������־��
	 input [15:0] imm16;		//imm16-ָ��е�16λ�������ֶΣ�
	 output [31:0] INST;	//INST-���ָ�
	 output [31:0] ADDR;	//��ǰָ���ַ��
	 
	 wire [31:0] PCin;		//PCin-PC�������룻
	 wire [31:0] PCout;		//PCout-PC���������
	 wire [31:0] PC_Plus_4;		//PC_Plus_4-��ǰPC��4��
	 wire [31:0] SEXTout;		//SEXTout-������չ�������
	 wire [31:0] Addr_Beq;		//Addr_Beq-������ת��ַ��
	 wire [31:0] Addr_Jump;		//Addr_Jump-��������ת��ַ��
	 wire [31:0] Addr_NJump;	//Addr_NJump-������������תָ��ĵ�ַ��
	 
	 PC U1 (.CLK(CLK), .PCin(PCin), .PCout(PCout));
	 Adder32 U2 (.A(PCout), .B(32'h4), .F(PC_Plus_4), .Cin(1'b0), .Cout(),
                .OF(), .SF(), .ZF(), .CF()
    				);
	 SEXT U3 (.datain(imm16), .dataout(SEXTout));
	 Adder32 U4 (.A(PC_Plus_4), .B(SEXTout << 2), .F(Addr_Beq), .Cin(1'b0), .Cout(),
                .OF(), .SF(), .ZF(), .CF()
    				);
	 MUX32_2_1 U5 (.X1(Addr_Beq), .X0(PC_Plus_4), .S(Branch & Zero), .Y(Addr_NJump));
	 MUX32_2_1 U6 (.X1(Addr_Jump), .X0(Addr_NJump), .S(Jump), .Y(PCin));
	 InstROM U7 (.Addr(PCout), .INST(INST));
	 
	 assign Addr_Jump = {PCout[31:28], INST[25:0], 2'b00};
	 assign ADDR = PCout;

endmodule
