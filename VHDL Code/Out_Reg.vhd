library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Out_Reg is
    Port ( 	clk,out_reg : in  STD_LOGIC;
				Data_in : in  STD_LOGIC_VECTOR (31 downto 0);
				Data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Out_Reg;

architecture Behavioral of Out_Reg is

	signal Reg : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
	
begin

	process (clk,out_reg)
	
		begin
			if rising_edge (clk) then	
				case out_reg is
					when '1' =>
						Data_out <= Data_in;
						Reg <= Data_in;
					when others => 
						Data_out <= Reg;
				end case;	
			end if;	

	end process;		
end Behavioral;