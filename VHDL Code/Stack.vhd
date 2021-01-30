library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity Stack is
    Port ( 
			  clk : in  STD_LOGIC;	
			  S_in : in  STD_LOGIC_VECTOR (31 downto 0);
           SW : in  STD_LOGIC;
           SR : in  STD_LOGIC;
			  S_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Stack;

architecture Behavioral of Stack is
	
	type stackType is array(0 to 31) of std_logic_vector(31 downto 0);
	
	SIGNAL Stack : stackType :=((others=> (others=>'0')));
	
	SIGNAL nop : STD_LOGIC := '0';
	
begin

	process (clk,SW,SR)
	variable S_adress : integer := 0;
		begin
			if rising_edge (clk) then
					if (SW = '1') then  --push
						if(S_adress = 31 ) then 
							nop <= '1';
						else
							nop <= '0';
						end if;
						if (nop = '0') then	
							Stack(S_adress) <= S_in;
							S_adress := S_adress + 1;
						end if;	
					end if;	
					if (SR = '1') then  --pop
						if (S_adress = 0) then
							nop <= '1';
						else
							nop <= '0';	
						end if;
						if (nop = '0') then
							S_adress := S_adress - 1;
						end if;	
					end if;
			end if;
	if (clk'event and clk='0') then	
		if (S_adress = 0) then
				S_out <= Stack(S_adress);
		else
				S_out <= Stack(S_adress-1);
		end if;
	end if;	
	end process;
end Behavioral;