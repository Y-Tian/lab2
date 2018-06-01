library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_add is port (
	ADDIN1			: in std_logic_vector(3 downto 0);
	ADDIN2			: in std_logic_vector(3 downto 0);
	
	ADDOUT		: out std_logic_vector(4 downto 0)
 );
 end alu_add;
 
 architecture Behavioural of alu_add is
 
 component alu_four_bit_adder port (
	A_f				: in std_logic_vector(3 downto 0);
	B_f				: in std_logic_vector(3 downto 0);
	CIN_f			: in std_logic;
	
	SUM_f			: out std_logic_vector(3 downto 0);
	COUT_f			: out std_logic
 );
 end component;
 
 signal adder_sum		: std_logic_vector(4 downto 0);
 signal adder_carry 	: std_logic;
 
 begin
 
 INST1: alu_four_bit_adder port map(ADDIN1, ADDIN2, 0, adder_sum, adder_carry);
 
 ADDOUT <= "000"&adder_carry&adder_sum;
 
 end architecture Behavioural;
 
 