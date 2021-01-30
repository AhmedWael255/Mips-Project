library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
	port (
		OpCode: in std_logic_vector(5 downto 0);
		ZeroFlag, LastBit: in std_logic;
		PC_MUX, ALU_OP: out std_logic_vector(1 downto 0);
		Reg_Dst, RegW, ALU_Src, MW, MReg, SW, SR, SReg, Branch, Jal_Mux, In_MUX, Out_MUX: out std_logic);
		
end control_unit;

architecture Behavioral of control_unit is

	begin
		process(OpCode,ZeroFlag, LastBit)
			begin
				
				RegW <= '0';
				MW <= '0';
				SW <= '0';
							
					case OpCode is
						when "000000" => --ALU Rd, Rs, Rt, Fun
							Reg_Dst <= '1';
							Jal_MUX <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							In_MUX <= '0';
							SReg <= '0';
							--MR <= '0';
							SR <= '0';
							Out_MUX <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							RegW <= '1';
							
						when "000001" => --Beq Rs, Rt, Offset
							ALU_Src <= '0';
							ALU_Op <= "11";
							Reg_Dst <= '0';							
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';	
							if(ZeroFlag = '1') then 
								Branch <= '1';
							else
								Branch <= '0';	
							end if;
								
						when "000010" => --BG Rs, Rt, Offset
							ALU_Src <= '0';
							ALU_Op <= "11";
							Reg_Dst <= '0';
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							if(LastBit = '0') and (ZeroFlag = '0') then
								Branch <= '1';
							else
								Branch <= '0';	
							end if;
					
					when "000011" => --BNE Rs, Rt, Offset
							ALU_Src <= '0';
							ALU_Op <= "11";
							Reg_Dst <= '0';							
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							if(ZeroFlag = '0') then 
								Branch <= '1';
							else
								Branch <= '0';	
							end if;	
								
					when "000100" => --BS Rs, Rt, Offset
							ALU_Src <= '0';
							ALU_Op <= "11";
							Reg_Dst <= '0';
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							if(LastBit = '1') and (ZeroFlag = '0') then
								Branch <= '1';
							else
								Branch <= '0';	
							end if;

					when "000101" => --LW  Rt, Target
							Reg_Dst <= '0';
							ALU_Src <= '1';
							ALU_Op <= "10";
							MReg <= '1';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							RegW <= '1';

					when "000110" => --MOVI Rt, Immediate
							Reg_Dst <= '0';
							ALU_Src <= '1';
							ALU_Op <= "10";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							RegW <= '1';

					when "000111" => --SW Rt, Target
							Reg_Dst <= '0';
							ALU_Src <= '1';
							ALU_Op <= "10";
							MW <= '1';
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';

					when "001000" => --J Jump_Target
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "11";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
                                                                             
					when "001001" => --JAL Jump_Target
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "11";
							Jal_MUX <= '1';
							In_MUX <= '0';
							Out_MUX <= '0';
							RegW <= '1';

					when "001010" => --JNZ Jump Target
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							if(ZeroFlag = '0') then
								PC_MUX <= "11";
							else
								PC_MUX <= "00";	
							end if;
							
					
					when "001011" => --JR Rs
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "01";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							
					when "001100" => --JZ Jump Target
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							if(ZeroFlag = '0') then
								PC_MUX <= "00";
							else
								PC_MUX <= "11";	
							end if;
							
							
					when "001101" => --IN Rt
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '1';
							Out_MUX <= '0';
							RegW <= '1';

					when "001110" => --MOV Rt, Rs
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "01";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							RegW <= '1';

					when "001111" => --Out Rs
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '1';

					when "010000" => --Pop Rt
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '1';
							SReg <= '1';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							RegW <= '1';

					when "010001" => --Push Rs
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "01";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';
							SW <= '1';

					when "010010" => --HLT
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "10";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';

					when "010011" => --NOP
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';

					when "010100" => --CMP Rs, Rt
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "11";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';

					when "010101" => --CMPI Rs, Immediate
							Reg_Dst <= '0';
							ALU_Src <= '1';
							ALU_Op <= "11";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';

					when others => 
							Reg_Dst <= '0';
							ALU_Src <= '0';
							ALU_Op <= "00";
							MReg <= '0';
							SR <= '0';
							SReg <= '0';
							Branch <= '0';
							PC_MUX <= "00";
							Jal_MUX <= '0';
							In_MUX <= '0';
							Out_MUX <= '0';

	 
					end case;
	end process;

end Behavioral;