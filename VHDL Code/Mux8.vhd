library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8 is --2-to-1 Mux
   port ( mux8_in0, mux8_in1 : in STD_LOGIC_VECTOR(31 DOWNTO 0);
			Branch: in STD_LOGIC;
			mux8_out: out STD_LOGIC_VECTOR(31 DOWNTO 0));		
end Mux8;

architecture Behavioral of Mux8 is
	
	
begin

  mux8_out <= mux8_in0 when Branch = '0' else
              mux8_in1 when Branch = '1' else
				  (others=>'Z');
				 
end Behavioral;

