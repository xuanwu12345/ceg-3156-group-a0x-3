LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY threeBitAdder IS
	PORT(
		i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(2 downto 0);
		o_CarryOut		: OUT	STD_LOGIC;
		o_Sum			: OUT	STD_LOGIC_VECTOR(2 downto 0));
END threeBitAdder;

ARCHITECTURE rtl OF threeBitAdder IS
	SIGNAL int_Sum, int_CarryOut : STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL gnd : STD_LOGIC;

	COMPONENT oneBitAdder
	PORT(
		i_CarryIn		: IN	STD_LOGIC;
		i_Ai, i_Bi		: IN	STD_LOGIC;
		o_Sum, o_CarryOut	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

	-- Concurrent Signal Assignment
	gnd <= '0';

add2: oneBitAdder
	PORT MAP (i_CarryIn => gnd, 
			  i_Ai => i_Ai(2),
			  i_Bi => i_Bi(2),
			  o_Sum => int_Sum(2),
			  o_CarryOut => int_CarryOut(2));

add1: oneBitAdder
	PORT MAP (i_CarryIn => int_CarryOut(2), 
			  i_Ai => i_Ai(1),
			  i_Bi => i_Bi(1),
			  o_Sum => int_Sum(1),
			  o_CarryOut => int_CarryOut(1));

add0: oneBitAdder
	PORT MAP (i_CarryIn => int_CarryOut(1), 
			  i_Ai => i_Ai(0),
			  i_Bi => i_Bi(0),
			  o_Sum => int_Sum(0),
			  o_CarryOut => int_CarryOut(0));

	-- Output Driver
	o_Sum <= int_Sum;
	o_CarryOut <= int_CarryOut(0);

END rtl;
