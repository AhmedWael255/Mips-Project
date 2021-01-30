library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is

    Port (
	  A, B   : in  STD_LOGIC_VECTOR(31 downto 0);
     ALU_Sel: in  STD_LOGIC_VECTOR(3 downto 0);
	  ALU_Out: out STD_LOGIC_VECTOR(31 downto 0);
	  LastBit : out STD_LOGIC;
	  zero : out STD_LOGIC
	  );
	  
end ALU; 
architecture Behavioral of ALU is

signal ALU_Result : std_logic_vector (31 downto 0);

begin
   process(A,B,ALU_Sel)
 begin
 
	  case(ALU_Sel) is
				when "0000" => 
					ALU_Result <= std_logic_vector(signed(A)) + std_logic_vector(signed(B)) ; 
				when "0001" => 
					ALU_Result <= std_logic_vector(signed(A)) - std_logic_vector(signed(B)) ;
				when "0010" => 
					ALU_Result <= std_logic_vector(signed(A) + 1) ; 
				when "0011" => 
					ALU_Result <= std_logic_vector(signed(A) - 1);
				when "0100" => 
					ALU_Result <= A(30 downto 0) & '0'; --Shift Left
				when "0101" => 
					ALU_Result <= '0' & A(31 downto 1); -- Shift Right
				when "0110" => 
					ALU_Result <= A(30 downto 0) & A(31); --Rotate Left
				when "0111" =>
					ALU_Result <= A(0) & A(31 downto 1); --Rotate Right
				when "1000" => 
					ALU_Result <= A and B;
				when "1001" => 
					ALU_Result <= A or B;
				when "1010" => 
					ALU_Result <= A xor B;
				when "1011" => 
					ALU_Result <= not A;
				when "1100" =>
					ALU_Result <= A + 0;
				when "1101" =>
					ALU_Result <= B + 0;	
				when others => 
					ALU_Result <= x"00000000";
				
	  end case;
 end process;
 
 ALU_Out <= ALU_Result;
 zero <= '1' when ALU_Result = x"00000000" else '0';
 LastBit <= ALU_Result(31);
 
end Behavioral;