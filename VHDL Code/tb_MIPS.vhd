library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity tb_MIPS is
end tb_MIPS;
 
architecture behavior of tb_MIPS is 
-- Component Declaration for the Unit Under Test (UUT)
component MIPS
	port(
			clk : IN  std_logic;
			reset : IN  std_logic;
			IN_Port : IN  std_logic_vector(31 downto 0);
			OUT_Port : OUT  std_logic_vector(31 downto 0)
			);
	end component;
	
--Inputs
signal tb_clk : std_logic := '0';
signal tb_reset : std_logic := '0';
signal tb_IN_Port : std_logic_vector(31 downto 0) := (others => '0');
--Outputs
signal tb_OUT_Port : std_logic_vector(31 downto 0);

-- Clock period definitions
constant clk_period : time := 30 ns; 

begin 
-- Instantiate the Unit Under Test (UUT)
u1_Test:entity work.MIPS(Behavioral)
	port map(
				clk => tb_clk,
				reset => tb_reset,
				IN_Port => tb_IN_Port,
				OUT_Port => tb_OUT_Port
				);
-- Clock process definitions
clk_process :process
	begin
		tb_clk <= '0';
		wait for clk_period/2;
		tb_clk <= '1';
		wait for clk_period/2;
	end process;
	
-- Stimulus process
stim_proc: process
	begin		
		tb_reset <= '1';
		wait for 100 ps;
		tb_reset <= '0';
		
--		tb_IN_Port <= x"00000002";
--		wait for clk_period;
--		tb_IN_Port <= x"00000005";
--		wait for clk_period;
--		tb_IN_Port <= x"00000000";

		wait;
	end process;
end;