library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux1 is --2-to-1 Mux
   port ( mux1_in0, mux1_in1 : in STD_LOGIC_VECTOR(4 DOWNTO 0);
			Reg_Dst: in STD_LOGIC;
			mux1_out: out STD_LOGIC_VECTOR(4 DOWNTO 0));		
end Mux1;

architecture Behavioral of Mux1 is
	
	
begin

  mux1_out <= mux1_in0 when Reg_Dst = '0' else
              mux1_in1 when Reg_Dst = '1' else
				  (others=>'Z');
				 
end Behavioral;

