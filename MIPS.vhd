library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS is
    --Port ( clk : in  STD_LOGIC;
      --     reset : in  STD_LOGIC);
end MIPS;

architecture Behavioral of MIPS is

	-- Program Counter  
	signal program_counter_reg : std_logic_vector(31 downto 0) := x"00400000";   
 
	signal instruction : std_logic_vector(31 downto 0);    
	-- R-Type Insruction  
	signal opCode : std_Logic_vector(5 downto 0);  
	signal src : std_logic_vector(4 downto 0);  
	signal tar : std_logic_vector(4 downto 0);  
	signal dst : std_logic_vector(4 downto 0);  
	signal shamt : std_logic_vector(4 downto 0);  
	signal func : std_logic_vector(5 downto 0);    
	-- I-Type Insruction  
	signal immed : std_logic_vector(15 downto 0);    
	-- J-Type Insruction  
	signal jump_addr : std_logic_vector(25 downto 0);

		--Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
	constant clk_period : time := 20 ns;



begin

	--Instantiate the Instruction Memory
	U01_IM: entity work.InstructionMemory(Behavioral) 
		PORT MAP (
					 ReadAddress => program_counter_reg,
					 Instruction => instruction
				    );
					 
		opCode <= instruction(31 downto 26); 
 
	-- R-Type  
	src <= instruction(25 downto 21);  
	tar <= instruction(20 downto 16);  
	dst <= instruction(15 downto 11);  
	shamt <= instruction(10 downto 6);  
	func <= instruction(5 downto 0);    
	-- I-Type  
	immed <= instruction(15 downto 0);    
	-- J-Type  
	jump_addr <= instruction(25 downto 0);   
	
	-- Clock process
	clk_process: process
	begin
		clk <= '0';
		wait for clk_period;
		
		clk <= '1';
		wait for clk_period;
	end process;
					 
end Behavioral;

