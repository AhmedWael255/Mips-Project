library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux6 is --2-to-1 Mux
   port ( mux6_in0, mux6_in1 : in STD_LOGIC_VECTOR(31 DOWNTO 0);
			Jal_Mux: in STD_LOGIC;
			mux6_out: out STD_LOGIC_VECTOR(31 DOWNTO 0));		
end Mux6;

architecture Behavioral of Mux6 is
	
	
begin

  mux6_out <= mux6_in0 when Jal_Mux = '0' else
              mux6_in1 when Jal_Mux = '1' else
				  (others=>'Z');
				 
end Behavioral;

