library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_one_bit_adder is port (
	A_o				: in std_logic;
	B_o				: in std_logic;
	CIN_o			: in std_logic;
	
	SUM_o			: out std_logic;
	COUT_o			: out std_logic
 );
 end alu_one_bit_adder;
 
 architecture Behavioural of alu_one_bit_adder is
 
 begin
 
 SUM_o <= (A_o XOR B_o) XOR CIN_o;
 COUT_o <= ((A_o XOR B_o) AND CIN_o) OR (A_o AND B_o);
 
 end architecture Behavioural;
 
 