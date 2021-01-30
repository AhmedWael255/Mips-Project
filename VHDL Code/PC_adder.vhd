library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC_adder is
	port(
		pc_out : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		pc_inc : out  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end PC_adder;

architecture Behavioral of PC_adder is

begin

	pc_inc <= std_logic_vector(unsigned(pc_out) + 1);

end Behavioral;

