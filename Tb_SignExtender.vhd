LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Tb_SignExtender IS
END Tb_SignExtender;
 
ARCHITECTURE behavior OF Tb_SignExtender IS 
    
   --Inputs
   signal tb_se_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal tb_se_out : std_logic_vector(31 downto 0);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   U1_Test: entity work.SignExtender(Behavioral) 
		PORT MAP (
          se_in => tb_se_in,
          se_out => tb_se_out
        );
 
   -- Stimulus process
   stim_proc: process
   begin	
	
		tb_se_in <= x"7fff";
		wait for 100 ns;

		tb_se_in <= x"8000";
		wait for 100 ns;	
  
		tb_se_in <= x"FFFF";
		wait for 100 ns;
	
		assert false
			report "End"
			severity failure;

   end process;

END;
