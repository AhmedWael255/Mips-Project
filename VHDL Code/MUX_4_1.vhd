library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4_1 is
    Port (  mux_in0 : in  STD_LOGIC_VECTOR (31 downto 0);
            mux_in1 : in  STD_LOGIC_VECTOR (31 downto 0);
            mux_in2 : in  STD_LOGIC_VECTOR (31 downto 0);
            mux_in3 : in  STD_LOGIC_VECTOR (31 downto 0);
				mux_ct : in  STD_LOGIC_VECTOR (1 downto 0);
				mux_out : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_4_1;

architecture Behavioral of MUX_4_1 is

begin
	
		mux_out <=	mux_in0 when mux_ct = "00" else
						mux_in1 when mux_ct = "01" else
						mux_in2 when mux_ct = "10" else
						mux_in3 when mux_ct = "11" else
					   (others=>'0');
	
end Behavioral;

