library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity RegisterFile is
	generic (
		B : integer := 32; --number of bits
		W : integer := 5 --number of address bits
	);
	port (
		ReadRegister1: in std_logic_vector(W-1 downto 0);
		ReadRegister2: in std_logic_vector(W-1 downto 0);
		WriteRegister: in std_logic_vector(W-1 downto 0);
		WriteData: in std_logic_vector(B-1 downto 0);
		RegWrite: in std_logic;
		ReadData1: out std_logic_vector(B-1 downto 0);
		ReadData2: out std_logic_vector(B-1 downto 0)
	);
end RegisterFile;

architecture Behavioral of RegisterFile is

	type reg_file_type is array(0 to 2**W-1) of
			std_logic_vector(B-1 downto 0);
			
	signal array_reg : reg_file_type := ( x"00000000", -- $zero
													  x"11111111", -- $at
													  x"22222222", -- $v0
													  x"33333333", -- $v1
													  x"44444444", -- $a0
													  x"55555555", -- $a1
													  x"66666666", -- $a2
													  x"77777777", -- $a3
													  x"88888888", -- $t0
													  x"99999999", -- $t1
													  x"aaaaaaaa", -- $t2
													  x"bbbbbbbb", -- $t3
													  x"cccccccc", -- $t4
													  x"dddddddd", -- $t5
													  x"eeeeeeee", -- $t6
													  x"ffffffff", -- $t7
													  x"00000000", -- $s0
													  x"11111111", -- $s1
													  x"22222222", -- $s2
													  x"33333333", -- $s3
													  x"44444444", -- $s4
													  x"55555555", -- $s5
													  x"66666666", -- $s6
													  x"77777777", -- $s7
													  x"88888888", -- $t8
													  x"99999999", -- $t9
													  x"aaaaaaaa", -- $k0
													  x"bbbbbbbb", -- $k1
													  x"10008000", -- $gp
													  x"7FFFF1EC", -- $sp
													  x"eeeeeeee", -- $fp
													  x"ffffffff"  -- $ra
												);
begin

	process (RegWrite) -- pulse on write
	begin
		if (RegWrite = '1') then
			array_reg(to_integer(unsigned(WriteRegister))) <= WriteData;
		end if;
	end process;
	
	-- read port
	ReadData1 <= array_reg(to_integer(unsigned(ReadRegister1)));
	ReadData2 <= array_reg(to_integer(unsigned(ReadRegister2)));

end Behavioral;

