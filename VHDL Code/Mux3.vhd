library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux3 is --2-to-1 Mux
   port ( mux3_in0, mux3_in1 : in STD_LOGIC_VECTOR(31 DOWNTO 0);
			ALU_Src: in STD_LOGIC;
			mux3_out: out STD_LOGIC_VECTOR(31 DOWNTO 0));		
end Mux3;

architecture Behavioral of Mux3 is
	
	
begin

  mux3_out <= mux3_in0 when ALU_Src = '0' else
              mux3_in1 when ALU_Src = '1' else
				  (others=>'Z');
				 
end Behavioral;

