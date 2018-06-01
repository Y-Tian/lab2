library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pb3_mux is port (
   EN        		: in  std_logic;
	CONCAT_IN 		: in  std_logic_vector(7 downto 0);	
	SUM_IN 			: in  std_logic_vector(7 downto 0);
	MUX_OUT			: out	std_logic_vector(7 downto 0)
);
end entity pb3_mux;

architecture Behavioral of pb3_mux is
   
begin
	MUX_OUT <= (SUM_IN) when (EN) else (CONCAT_IN);

end architecture Behavioral;
