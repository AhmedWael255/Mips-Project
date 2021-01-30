library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc_con is
	port(
		inst : in STD_LOGIC_VECTOR(25 downto 0);
		pc   : in STD_LOGIC_VECTOR(5 downto 0);
		pc_ins : out STD_LOGIC_VECTOR(31 downto 0)
	);
end pc_con;

architecture Behavioral of pc_con is

begin

	pc_ins <= pc & inst;

end Behavioral;

