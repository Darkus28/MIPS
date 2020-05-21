LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_Controller IS
END Tb_Controller;
 
ARCHITECTURE behavior OF Tb_Controller IS 
 
   --Inputs
   signal tb_OpCode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal tb_RegDst : std_logic;
   signal tb_Jump : std_logic;
   signal tb_Branch : std_logic;
   signal tb_MemRead : std_logic;
   signal tb_MemToReg : std_logic;
   signal tb_ALUOp : std_logic_vector(1 downto 0);
   signal tb_MemWrite : std_logic;
   signal tb_ALUSrc : std_logic;
   signal tb_RegWrite : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   U1_Test: entity work.Controller(Behavioral) 
		PORT MAP (
          OpCode => tb_OpCode,
          RegDst => tb_RegDst,
          Jump => tb_Jump,
          Branch => tb_Branch,
          MemRead => tb_MemRead,
          MemToReg => tb_MemToReg,
          ALUOp => tb_ALUOp,
          MemWrite => tb_MemWrite,
          ALUSrc => tb_ALUSrc,
          RegWrite => tb_RegWrite
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
		tb_OpCode <="000000"; -- R-Type
		wait for 50 ns;
		
		tb_OpCode <="100011"; -- Load Word
		wait for 50 ns;
		
		tb_OpCode <="101011"; -- Store Word
		wait for 50 ns;
		
		tb_OpCode <="000100"; -- Branch Equal
		wait for 50 ns;
		
		tb_OpCode <="000010"; -- Jump
		wait for 50 ns;
		
		tb_OpCode <="111111"; -- Unknown
		wait for 50 ns;
		
		assert false
			report "End"
			severity failure;
			
   end process;

END;
