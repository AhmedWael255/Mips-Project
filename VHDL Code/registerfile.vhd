library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;



entity registerfile is

port( 
		clk : in  STD_LOGIC;
		readregister1 : in std_logic_vector (4 downto 0);
      readregister2 : in std_logic_vector (4 downto 0);
		writeregister : in std_logic_vector (4 downto 0);
		writedata : in std_logic_vector (31 downto 0);
		regwrite:in std_logic;
		readdata1:out std_logic_vector (31 downto 0);
		readdata2:out std_logic_vector(31 downto 0)
		);
end registerfile;

architecture Behavioral of registerfile is


 type reg_file_type is array (0 to 31) of std_logic_vector(31 downto 0);
 signal array_reg : reg_file_type :=((others=> (others=>'0')));
 
begin	
	process (clk,regwrite)
		begin
			if rising_edge (clk) then				
					 if (regwrite ='1') then
						array_reg(to_integer(unsigned(writeregister)))<= writedata;
					 end if;
			end if;
			if (clk'event and clk='0') then
				readdata1<= array_reg(to_integer(unsigned(readregister1)));
				readdata2<= array_reg(to_integer(unsigned(readregister2)));	
			end if;
	end process;	
end Behavioral;