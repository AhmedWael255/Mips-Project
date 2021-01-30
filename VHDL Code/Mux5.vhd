library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux5 is --2-to-1 Mux
   port ( mux5_in0, mux5_in1 : in STD_LOGIC_VECTOR(31 DOWNTO 0);
			In_MUX: in STD_LOGIC;
			mux5_out: out STD_LOGIC_VECTOR(31 DOWNTO 0));		
end Mux5;

architecture Behavioral of Mux5 is
	
	
begin

  mux5_out <= mux5_in0 when In_MUX = '0' else
              mux5_in1 when In_MUX = '1' else
				  (others=>'Z');
				 
end Behavioral;

