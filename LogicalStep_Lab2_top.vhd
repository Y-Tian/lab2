library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb					: in	std_logic_vector(3 downto 0);
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
------------------------------------------------------------------- 
  component SevenSegment port (
   hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   ); 
   end component;
	
  component segment7_mux port (
	clk			: in std_logic := '0';
	DIN2			: in std_logic_vector(6 downto 0);
	DIN1			: in std_logic_vector(6 downto 0);
	DOUT			: out std_logic_vector(6 downto 0);
	DIG2			: out std_logic;
	DIG1			: out std_logic
  );
  end component;
  
  component pb3_mux port (
   EN				: in std_logic;
	CONCAT_IN	: in std_logic_vector(7 downto 0);
	SUM_IN		: in std_logic_vector(7 downto 0);
	MUX_OUT		: in std_logic_vector(7 downto 0)
  );
  end component;
  
  component alu_and port (
	ANDIN1			: in std_logic_vector(3 downto 0);
	ANDIN2			: in std_logic_vector(3 downto 0);
	
	ANDOUT		: out std_logic_vector(3 downto 0)
  );
  end component;
  
  component alu_or port (
	ORIN1			: in std_logic_vector(3 downto 0);
	ORIN2			: in std_logic_vector(3 downto 0);
	
	OROUT			: out std_logic_vector(3 downto 0)
  );
  end component;
 
  component alu_xor port (
	XORIN1			: in std_logic_vector(3 downto 0);
	XORIN2			: in std_logic_vector(3 downto 0);
	
	XOROUT		: out std_logic_vector(3 downto 0)
  );
  end component;
  
  component alu_add port (
   ADDIN1			: in std_logic_vector(3 downto 0);
	ADDIN2			: in std_logic_vector(3 downto 0);
	
	ADDOUT		: out std_logic_vector(7 downto 0)
  );
  end component;
	
-------------------------------------------------------------------	
	
-- Create any signals, or temporary variables to be used
--
-- Note that there are two basic types and mixing them is difficult
--  unsigned is a signal which can be used to perform math operations such as +, -, *
--  std_logic_vector is a signal which can be used for logic operations such as OR, AND, NOT, XOR
--
	signal seg7_A		: std_logic_vector(6 downto 0);
	signal hex_A		: std_logic_vector(3 downto 0);
	
	signal hex_B		: std_logic_vector(3 downto 0);
	signal seg7_B		: std_logic_vector(6 downto 0);
	
	signal pb_bar		: std_logic_vector(3 downto 0);
	
	signal and_r		: std_logic_vector(3 downto 0);
	signal or_r			: std_logic_vector(3 downto 0);
	signal xor_r		: std_logic_vector(3 downto 0);
	signal add_r		: std_logic_vector(4 downto 0);
	signal pb3_mux_r	: std_logic_vector(7 downto 0);
	signal out_led		: std_logic_vector(7 downto 0);
	
	
-- Here the circuit begins

begin

	pb_bar <= NOT(pb);

	hex_A <= sw(3 downto 0);
 --seg7_data <= seg7_A;
 
	hex_B <= sw(7 downto 4);
 
--COMPONENT HOOKUP
--
-- generate the seven segment coding

	INST1: SevenSegment port map(hex_A, seg7_A);
	INST2: SevenSegment port map(hex_B, seg7_B);
	
	INST3: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data, seg7_char2, seg7_char1);
	
	
	---------
	INST4: alu_and port map(hex_A, hex_B, and_r);
	INST5: alu_or port map(hex_A, hex_B, or_r);
	INST6: alu_xor port map(hex_A, hex_B, xor_r);
	INST7: alu_add port map(hex_A, hex_B, add_r);
	
	--not tested
	
	with pb_bar select out_led
	<= add_r when "1000",
		xor_r when "0100",
		or_r  when "0010",
		and_r when "0001";
		"00000000" when others;
	
	-- Runs all the time
	INST8: pb3_mux port map(pb_bar(3), hex_A&hex_B, add_r, pb3_mux_r);
	
	--@TODO Split up pb3_mux_r into hex_a and hex_b as pb3_mux_r(7 downto 4) etc.
	-- Probably throw it into a case statement for the displays
	
	
	
	INST1: SevenSegment port map(hex_A, seg7_A);
	INST2: SevenSegment port map(hex_B, seg7_B);
	
	INST3: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data, seg7_char2, seg7_char1);

end SimpleCircuit;

