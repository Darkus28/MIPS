LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 -- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_ALU IS
END Tb_ALU;
 
ARCHITECTURE behavior OF Tb_ALU IS 
     
   --Inputs
   signal tb_a1 : std_logic_vector(31 downto 0) := (others => '0');
   signal tb_a2 : std_logic_vector(31 downto 0) := (others => '0');
   signal tb_alu_control : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal tb_ALU_result : std_logic_vector(31 downto 0);
   signal tb_Zero : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   U1_Test: entity work.ALU(Behavioral) 
	PORT MAP (
          a1 => tb_a1,
          a2 => tb_a2,
          alu_control => tb_alu_control,
          ALU_result => tb_ALU_result,
          Zero => tb_Zero
        );

   -- Stimulus process
   stim_proc: process
   begin	
	
		tb_a1 <= x"00000003";
		tb_a2 <= x"FFFFFFFF";
		
		tb_alu_control <= "0000"; -- Bitwise And
		wait for 50 ns;
		
		tb_alu_control <= "0001"; -- Bitwise Or
		wait for 50 ns;
		
		tb_alu_control <= "0010"; -- Addition
		wait for 50 ns;
		
		tb_alu_control <= "0110"; -- Subtraction
		wait for 50 ns;
		
		tb_alu_control <= "0111"; -- Set Less Than
		wait for 50 ns;
		
		tb_alu_control <= "1100"; -- Bitwise Nor
		wait for 50 ns;
		
		assert false
			report "End"
			severity failure;
			
   end process;

END;
