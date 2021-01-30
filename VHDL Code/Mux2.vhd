library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is --2-to-1 Mux
   port ( mux2_in0, mux2_in1 : in STD_LOGIC_VECTOR(4 DOWNTO 0);
			Jal_Mux: in STD_LOGIC;
			mux2_out: out STD_LOGIC_VECTOR(4 DOWNTO 0));		
end Mux2;

architecture Behavioral of Mux2 is
	
	
begin

  mux2_out <= mux2_in0 when Jal_Mux = '0' else
              mux2_in1 when Jal_Mux = '1' else
				  (others=>'Z');
				 
end Behavioral;

