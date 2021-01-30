library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALU_Control is
    Port ( FN : in  STD_LOGIC_VECTOR (3 downto 0);
           ALUoP : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUsel : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_Control;

architecture Behavioral of ALU_Control is

begin
	process(ALUoP,FN)
		begin
			case(ALUoP) is
			when "00" => 
				ALUsel <= FN;
			when "01" => 			--nop on A
				ALUsel <= "1100";
			when "10" => 			--nop on B
				ALUsel <= "1101";
			when "11" =>
				ALUsel <= "0001";
			when others =>
				ALUsel <= "0000"; 

	  end case;
 end process;

end Behavioral;

