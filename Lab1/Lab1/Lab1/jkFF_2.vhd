LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY jkFF_2 IS
	PORT(
		i_j, i_k	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END jkFF_2;

ARCHITECTURE rtl OF jkFF_2 IS
	SIGNAL int_q, int_qBar, int_muxOutput : STD_LOGIC;
	SIGNAL int_jk : STD_LOGIC_VECTOR(1 downto 0);

	COMPONENT dFF_2
		PORT(
			i_d			: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

dFlipFlop: dFF_2
	PORT MAP (i_d => int_muxOutput, 
			  i_clock => i_clock,
			  o_q => int_q,
	          o_qBar => int_qBar);

int_jk			<=	i_j & i_k;
int_muxOutput	<=	int_q when int_jk = "00" else
					'0' when int_jk = "01" else
					'1' when int_jk = "10" else
					int_qBar;

	-- Output Driver
	o_q	<= int_q;
	o_qBar	<= int_qBar;

END rtl;
