LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY threeBitComparator IS
	PORT(
		i_Ai, i_Bi			: IN	STD_LOGIC_VECTOR(2 downto 0);
		o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
END threeBitComparator;

ARCHITECTURE rtl OF threeBitComparator IS
	SIGNAL int_GT, int_LT : STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL gnd : STD_LOGIC;

	COMPONENT oneBitComparator
	PORT(
		i_GTPrevious, i_LTPrevious	: IN	STD_LOGIC;
		i_Ai, i_Bi			: IN	STD_LOGIC;
		o_GT, o_LT			: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

	-- Concurrent Signal Assignment
	gnd <= '0';

comp2: oneBitComparator
	PORT MAP (i_GTPrevious => gnd, 
	          i_LTPrevious => gnd,
			  i_Ai => i_Ai(2),
			  i_Bi => i_Bi(2),
			  o_GT => int_GT(2),
			  o_LT => int_LT(2));

comp1: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(2), 
	          i_LTPrevious => int_LT(2),
			  i_Ai => i_Ai(1),
			  i_Bi => i_Bi(1),
			  o_GT => int_GT(1),
			  o_LT => int_LT(1));

comp0: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(1), 
	          i_LTPrevious => int_LT(1),
			  i_Ai => i_Ai(0),
			  i_Bi => i_Bi(0),
			  o_GT => int_GT(0),
			  o_LT => int_LT(0));

	-- Output Driver
	o_GT <= int_GT(0);
	o_LT <= int_LT(0);
	o_EQ <= int_GT(0) nor int_LT(0);

END rtl;
