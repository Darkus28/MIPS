LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_AluControl IS
END Tb_AluControl;
 
ARCHITECTURE behavior OF Tb_AluControl IS 
 
   --Inputs
   signal tb_funct : std_logic_vector(5 downto 0) := (others => '0');
   signal tb_ALUOp : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal tb_Operation : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.AluControl(Behavioral) 
		PORT MAP (
          funct => tb_funct,
          ALUOp => tb_ALUOp,
          Operation => tb_Operation
        );

   -- Stimulus process
   stim_proc: process
   begin

		-- R-Type Commands
		tb_ALUOp <="10";
		tb_funct <= "100100"; -- and
		wait for 20 ns;
		
		tb_ALUOp <="10";
		tb_funct <= "100101"; -- or
		wait for 20 ns;
		
		tb_ALUOp <="10";
		tb_funct <= "100000"; -- add
		wait for 20 ns;
		
		tb_ALUOp <="10";
		tb_funct <= "100010"; -- sub
		wait for 20 ns;
		
		tb_ALUOp <="10";
		tb_funct <= "101010"; -- slt
		wait for 20 ns;
		
		-- I-Type Commands
		
		-- Load Word Command
		tb_ALUOp <="00";
		tb_funct <= "XXXXXX";
		wait for 20 ns;
		
		-- Store Word Command
		tb_ALUOp <="00";
		tb_funct <= "XXXXXX";
		wait for 20 ns;
		
		-- Branch Equal Command
		tb_ALUOp <="01";
		tb_funct <= "XXXXXX";
		wait for 20 ns;
		
		assert false
			report "End"
			severity failure;
		
   end process;

END;
