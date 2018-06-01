library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_or is port (
	ORIN1			: in std_logic_vector(3 downto 0);
	ORIN2			: in std_logic_vector(3 downto 0);
	
	OROUT			: out std_logic_vector(3 downto 0)
 );
 end alu_or;
 
 architecture Behavioural of alu_or is
 
 begin
 
 OROUT <= ORIN1 OR ORIN2;
 
 end architecture Behavioural;
 
 