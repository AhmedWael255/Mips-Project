library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
	port(
		pc_inc : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		se_out : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BRC    : out STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end adder;

architecture Behavioral of adder is

begin

	BRC <= STD_LOGIC_VECTOR(unsigned(pc_inc) + unsigned(se_out));

end Behavioral;

