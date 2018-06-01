library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_xor is port (
	XORIN1			: in std_logic_vector(3 downto 0);
	XORIN2			: in std_logic_vector(3 downto 0);
	
	XOROUT		: out std_logic_vector(3 downto 0)
 );
 end alu_xor;
 
 architecture Behavioural of alu_xor is
 
 begin
 
 XOROUT <= XORIN1 OR XORIN2;
 
 end architecture Behavioural;
 
 