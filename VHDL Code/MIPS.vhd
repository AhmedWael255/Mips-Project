library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MIPS is
	port(
		clk,reset : in  STD_LOGIC;
		IN_Port  : in  STD_LOGIC_VECTOR (31 downto 0);
		OUT_Port : out STD_LOGIC_VECTOR (31 downto 0)
		);
end MIPS;

architecture Behavioral of MIPS is

	 signal ALU_Out,mux_out,mux3_out,mux4_out,mux5_out,mux6_out,mux7_out,Data_out,mux8_out,pc_out,S_out,instruction,readdata1,readdata2,se_out,readData,pc_inc,BRC,pc_ins	: STD_LOGIC_VECTOR (31 downto 0);
	 signal ALUsel: STD_LOGIC_VECTOR (3 downto 0);
	 signal LastBit,zero,Reg_Dst, RegW, ALU_Src, MW, MReg, SW, SR, SReg, Branch, Jal_Mux, In_MUX, Out_MUX : STD_LOGIC;
	 signal mux1_out,mux2_out :  STD_LOGIC_VECTOR(4 DOWNTO 0);
	 signal PC_MUX, ALU_OP:  std_logic_vector(1 downto 0);
	 
begin

X1: entity work. PC (Behavioral) 
		port map (
					clk => clk,
					reset => reset,
					pc_in => mux_out,
					pc_out => pc_out
				  );
				
X2: entity work. instructionMemory (Behavioral) 
		port map (
					readAddress => pc_out(4 downto 0),
					instruction =>instruction
				  );
				
X3: entity work. control_unit (Behavioral) 
		port map (
					OpCode => instruction(31 downto 26),
					ZeroFlag => zero,
					LastBit => LastBit,
					PC_MUX => PC_MUX,
					ALU_OP => ALU_OP,
					Reg_Dst => Reg_Dst,
					RegW => RegW,
					ALU_Src => ALU_Src,
					MW => MW,
					MReg => MReg,
					SW => SW,
					SR => SR,
					SReg => SReg,
					Branch => Branch,
					Jal_Mux => Jal_Mux,
					In_MUX => In_MUX,
					Out_MUX => Out_MUX
				  );

X4: entity work. Mux1 (Behavioral)
		port map (
					mux1_in0 => instruction(20 downto 16),
					mux1_in1 => instruction(15 downto 11),
					Reg_Dst => Reg_Dst,
					mux1_out => mux1_out
				  );

X5: entity work. Mux2 (Behavioral) 
		port map (
					mux2_in0 => mux1_out,
					mux2_in1 => "11110",
					Jal_Mux => Jal_Mux,
					mux2_out => mux2_out
				  );

X6: entity work. registerfile (Behavioral) 
		port map (
					clk => clk,
					readregister1 => instruction(25 downto 21),
					readregister2 => instruction(20 downto 16),
					writeregister => mux2_out,
					writedata => mux7_out,
					regwrite => RegW,
					readdata1 => readdata1,
					readdata2 => readdata2
				  );

X7: entity work. signextender (Behavioral) 
		port map (
					se_in => instruction(15 downto 0),
					se_out => se_out
				  );

X8: entity work. Mux3 (Behavioral) 
		port map (
					mux3_in0 => readdata2,
					mux3_in1=> se_out,
					ALU_Src => ALU_Src,
					mux3_out => mux3_out
				  );

X9: entity work. ALU_Control (Behavioral) 
		port map (
					FN => instruction(3 downto 0),
					ALUoP => ALU_OP,
					ALUsel => ALUsel
				  );
				  
X10:entity work. ALU (Behavioral)
		port map (
					A => readdata1,
					B => mux3_out,
					ALU_Sel => ALUsel,
					ALU_Out => ALU_Out,
					LastBit => LastBit,
					zero => zero
				  );

X11:entity work. dataMemory (Behavioral) 
		port map (
					clk => clk,
					address => ALU_Out(7 downto 0),
					writeData => readdata2,
					memWrite => MW,
					readData => readData
				  );

X12:entity work. Mux4 (Behavioral) 
		port map (
					mux4_in0 => ALU_Out,
					mux4_in1 => readData,
					MReg => MReg,
					mux4_out => mux4_out
				  );

X13:entity work. Mux5 (Behavioral) 
		port map (
					mux5_in0 => mux4_out,
					mux5_in1 => IN_Port,
					In_MUX => In_MUX,
					mux5_out => mux5_out
				  );

X14:entity work. PC_adder (Behavioral)
		port map (
					pc_out => pc_out,
					pc_inc => pc_inc
				  );

X15:entity work. Mux6 (Behavioral) 
		port map (
					mux6_in0 => mux5_out,
					mux6_in1 => pc_inc,
					Jal_Mux => Jal_Mux,
					mux6_out => mux6_out
				  );

X16:entity work. Stack (Behavioral) 
		port map (
					clk => clk,
					S_in => ALU_Out,
					SW => SW,
					SR => SR,
					S_out => S_out
				  );

X17:entity work. Mux7 (Behavioral) 
		port map (
					mux7_in0 => mux6_out,
					mux7_in1 => S_out,
					SReg => SReg,
					mux7_out => mux7_out
				  );

X18:entity work. Out_Reg (Behavioral) 
		port map (
					clk => clk,
					out_reg => Out_MUX,
					Data_in => readdata1,
					Data_out => Data_out
				  );

X19:entity work. adder (Behavioral) 
		port map (
					pc_inc => pc_inc,
					se_out => se_out,
					BRC => BRC
				  );

X20:entity work. Mux8 (Behavioral) 
		port map (
					mux8_in0 => pc_inc,
					mux8_in1 => BRC,
					Branch => Branch,
					mux8_out => mux8_out
				  );

X21:entity work. pc_con (Behavioral) 
		port map (
					inst => instruction(25 downto 0),
					pc => pc_out(31 downto 26),
					pc_ins => pc_ins
				  );

X22:entity work. MUX_4_1 (Behavioral) 
		port map (
					mux_in0 => mux8_out,
					mux_in1 => readdata1,
					mux_in2 => pc_out,
					mux_in3 => pc_ins,
					mux_ct => PC_MUX,
					mux_out=> mux_out
				  );

				OUT_Port <= Data_out;
				
end Behavioral;