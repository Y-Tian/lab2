library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_and is port (
	ANDIN1			: in std_logic_vector(3 downto 0);
	ANDIN2			: in std_logic_vector(3 downto 0);
	
	ANDOUT		: out std_logic_vector(3 downto 0)
 );
 end alu_and;
 
 architecture Behavioural of alu_and is
 
 begin
 
 ANDOUT <= ANDIN1 AND ANDIN2;
 
 end architecture Behavioural;
 
 