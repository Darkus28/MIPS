LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Tb_InstructionMemory IS
END Tb_InstructionMemory;
 
ARCHITECTURE behavior OF Tb_InstructionMemory IS 
    
   --Inputs
   signal tb_ReadAddress : std_logic_vector(31 downto 0) := x"003FFFFC";

 	--Outputs
   signal tb_Instruction : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   U1_Test: entity work.InstructionMemory(Behavioral) 
		PORT MAP (
					 ReadAddress => tb_ReadAddress,
					 Instruction => tb_Instruction
				    );

   -- Stimulus process
   stim_proc: process
   begin		
		
		-- Read 12 commands
		for I in 0 to 11 loop
			tb_ReadAddress <= x"00400000" or std_logic_vector(to_unsigned(I*4,32));
			wait for 25 ns;
		end loop;
		
		assert false
			report "End"
			severity failure;
			
   end process;

END;
