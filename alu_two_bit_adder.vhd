library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_two_bit_adder is port (
	A_t				: in std_logic_vector(1 downto 0);
	B_t				: in std_logic_vector(1 downto 0);
	CIN_t			: in std_logic;
	
	SUM_t			: out std_logic_vector(1 downto 0);
	COUT_t			: out std_logic
 );
 end alu_two_bit_adder;
 
 architecture Behavioural of alu_two_bit_adder is
 
 
  component alu_one_bit_adder port (
   A_o				: in std_logic;
	B_o				: in std_logic;
	CIN_o			: in std_logic;
	
	SUM_o			: out std_logic;
	COUT_o			: out std_logic
  );
  end component;
  
  signal sum0 : std_logic;
  signal sum1 : std_logic;
  
  signal cout0 : std_logic;
  signal cout1 : std_logic;
 
 begin
 
 SUM_t <= sum1&sum0;
 COUT_t <= cout1;

 INST1: alu_one_bit_adder(A_t(0), B_t(0), 0, sum0, cout0);
 INST2: alu_one_bit_adder(A_t(1), B_t(1), cout0, sum1, cout1);
 
 end architecture Behavioural;
 
 