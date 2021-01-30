library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux7 is --2-to-1 Mux
   port ( mux7_in0, mux7_in1 : in STD_LOGIC_VECTOR(31 DOWNTO 0);
			SReg: in STD_LOGIC;
			mux7_out: out STD_LOGIC_VECTOR(31 DOWNTO 0));		
end Mux7;

architecture Behavioral of Mux7 is
	
	
begin

  mux7_out <= mux7_in0 when SReg = '0' else
              mux7_in1 when SReg = '1' else
				  (others=>'Z');
				 
end Behavioral;

