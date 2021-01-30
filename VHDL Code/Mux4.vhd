library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4 is --2-to-1 Mux
   port ( mux4_in0, mux4_in1 : in STD_LOGIC_VECTOR(31 DOWNTO 0);
			MReg: in STD_LOGIC;
			mux4_out: out STD_LOGIC_VECTOR(31 DOWNTO 0));		
end Mux4;

architecture Behavioral of Mux4 is
	
	
begin

  mux4_out <= mux4_in0 when MReg = '0' else
              mux4_in1 when MReg = '1' else
				  (others=>'Z');
				 
end Behavioral;

