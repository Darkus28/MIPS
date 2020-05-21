LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Tb_DataMemory IS
END Tb_DataMemory;
 
ARCHITECTURE behavior OF Tb_DataMemory IS 
 
   --Inputs
   signal tb_Address : std_logic_vector(31 downto 0) := (others => '0');
   signal tb_WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal tb_MemRead : std_logic := '0';
   signal tb_MemWrite : std_logic := '0';

 	--Outputs
   signal tb_ReadData : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.DataMemory(Behavioral) 
	PORT MAP (
          Address => tb_Address,
          WriteData => tb_WriteData,
          MemRead => tb_MemRead,
          MemWrite => tb_MemWrite,
          ReadData => tb_ReadData
        );

   -- Stimulus process
   stim_proc: process
   begin		

		--write two memory locations
		tb_Address <= x"10010000";
		tb_WriteData <= x"11112222";
		tb_MemWrite <= '0';
		wait for 10 ns;
		tb_MemWrite <= '1';
		wait for 10 ns;
		tb_MemWrite <= '0';
		wait for 10 ns;
		--assert(MemWrite = '0') report "Just Wrote Memory" severity note;
		
		tb_Address <= x"10010004";
		tb_WriteData <= x"33334444";
		tb_MemWrite <= '0';
		wait for 10 ns;
		tb_MemWrite <= '1';
		wait for 10 ns;
		tb_MemWrite <= '0';
		wait for 10 ns;
		
		--read two memory locations
		tb_Address <= x"10010000";
		tb_MemRead <= '0';
		wait for 10 ns;
		tb_MemRead <= '1';
		wait for 10 ns;
		tb_MemRead <= '0';
		wait for 10 ns;
		
		tb_Address <= x"10010004";
		tb_MemRead <= '0';
		wait for 10 ns;
		tb_MemRead <= '1';
		wait for 10 ns;
		tb_MemRead <= '0';
		wait for 10 ns;
		
		assert false
			report "End"
			severity failure;
			
   end process;

END;
