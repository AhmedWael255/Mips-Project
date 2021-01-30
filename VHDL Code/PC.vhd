library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PC is
	port(
			clk,reset : in  STD_LOGIC;
			pc_in : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
			pc_out : out  STD_LOGIC_VECTOR(31 DOWNTO 0)
	    );
end PC;

architecture Behavioral of PC is

begin
	process (clk,reset)
	begin
			if (reset = '1') then
				pc_out <= x"00000000";
			
			elsif rising_edge (clk) then
				if (pc_in = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") then
					pc_out <= x"00000000";
				else	
					pc_out <= pc_in after 15 ns;
				end if;		
			end if;
	end process;		
end Behavioral;

