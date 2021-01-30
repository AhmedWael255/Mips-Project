LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


ENTITY dataMemory IS
	
	PORT (
		clk : in  STD_LOGIC;
		address   : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		writeData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		memWrite  : IN STD_LOGIC;
		readData  : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);

END dataMemory;


ARCHITECTURE Behavioral OF dataMemory IS

	TYPE RAM_16_x_32 IS ARRAY(0 TO 255) OF std_logic_vector(31 DOWNTO 0);

	SIGNAL DM : RAM_16_x_32 :=((others=> (others=>'0')));

BEGIN

	PROCESS (clk,memWrite) 
	BEGIN
		
		if rising_edge (clk) then
			IF (memWrite = '1') THEN
				DM(to_integer(unsigned(address))) <= writeData;
			END IF;
		end if;	
		IF (clk' event and clk='0') THEN
			readData <= DM(to_integer(unsigned(address)));
		END IF;
	END PROCESS;
	
END Behavioral;

