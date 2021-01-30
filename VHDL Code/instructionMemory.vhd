LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY instructionMemory IS
	PORT (
		readAddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		instruction : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END instructionMemory;


ARCHITECTURE Behavioral OF instructionMemory IS

	TYPE RAM_5_x_32 IS ARRAY(0 TO 31) OF std_logic_vector(31 DOWNTO 0);

	constant IM : RAM_5_x_32 := ( x"18000002", --0       MOVI R0,2                 b"0001,1000,0000,0000,0000,0000,0000,1010"
											x"18010005", --1       MOVI R1,5                 b"0001,1000,0000,0001,0000,0000,0001,0010"
											x"00631801", --2       ALU  R3,R3,R3,SUB         b"0000,0000,0110,0011,0001,1000,0000,0001"
											x"10010003", --3       BS   R0,R1,L0      (3)    b"0001,0000,0000,0001,0000,0000,0000,0011"
											x"38220000", --4       MOV  R2,R1                b"0011,1000,0010,0010,0000,0000,0000,0000"
											x"38040000", --5       MOV  R4,R0                b"0011,1000,0000,0100,0000,0000,0000,0000"
											x"20000009", --6       J    L1            (9)    b"0010,0000,0000,0000,0000,0000,0000,1001"
											x"38020000", --7  L0:  MOV  R2,R0                b"0011,1000,0010,0000,0000,0000,0000,0000"
											x"38240000", --8       MOV  R4,R1                b"0011,1000,0010,0100,0000,0000,0000,0000"
											x"18050000", --9  L1:  MOVI R5,0                 b"0001,1000,0000,0101,0000,0000,0000,0000"
											x"04450003", --10 L3:  BEQ  R2,R5,L2      (3)    b"0000,0100,0100,0101,0000,0000,0000,0011"
											x"00641800", --11      ALU  R3,R3,R4,ADD         b"0000,0000,0110,0100,0001,1000,0000,0000"
											x"00421003", --12      ALU  R2,R2,R2,DEC         b"0000,0000,0100,0010,0001,0000,0000,0011"
											x"2000000A", --13      J    L3            (10)   b"0010,0000,0000,0000,0000,0000,0000,1010"
											x"3C600000", --14 L2:  OUT  R3                   b"0011,1100,0110,0000,0000,0000,0000,0000"
											x"4C000000", --15      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --16      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --17      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"48000000", --18      HLT                       b"0100,1000,0000,0000,0000,0000,0000,0000"
											x"4C000000", --19      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --20      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --21      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --22      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --23      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --24      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --25      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --26      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --27      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --28      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --29      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000", --30      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											x"4C000000"  --31      NOP                       b"0100,1100,0000,0000,0000,0000,0000,0000"
											);

BEGIN
process (readAddress)
		begin
			if (readAddress = "UUUUU") then
			else
				instruction <= IM(to_integer(unsigned(readAddress)));
			end if;
	end process;		
END Behavioral;