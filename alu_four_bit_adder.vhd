library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_four_bit_adder is port (
	A_f				: in std_logic_vector(3 downto 0);
	B_f				: in std_logic_vector(3 downto 0);
	CIN_f			: in std_logic;
	
	SUM_f			: out std_logic_vector(3 downto 0);
	COUT_f			: out std_logic
 );
 end alu_four_bit_adder;
 
 architecture Behavioural of alu_four_bit_adder is
 
 
  component alu_two_bit_adder port (
	A_t				: in std_logic_vector(1 downto 0);
	B_t				: in std_logic_vector(1 downto 0);
	CIN_t			: in std_logic;
	
	SUM_t			: out std_logic_vector(1 downto 0);
	COUT_t			: out std_logic
  );
  end component;
  
  signal sum0 : std_logic_vector(1 downto 0);
  signal sum1 : std_logic_vector(1 downto 0);
  
  signal cout0 : std_logic;
  signal cout1 : std_logic;
 
 begin
 
 SUM_f <= sum1&sum0;
 COUT_f <= cout1;

 INST1: alu_two_bit_adder(A_f(1 downto 0), B_f(1 downto 0), 0, sum0, cout0);
 INST2: alu_two_bit_adder(A_f(3 downto 2), B_f(3 downto 2), cout0, sum1, cout1);
 
 end architecture Behavioural;
 