--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Design testbench for Exemple1 VHDL codes (Section3)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: Exemple1.vhd (Section3)
--				 
--				 
--			     
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
--------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity Exercise1_tb is
end Exercise1_tb;

architecture behavioral of Exercise1_tb is

	signal clock 			: std_logic := '0';
	signal estimulo_vector 	: std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        	: std_logic;
	
	signal rst				: std_logic := '0'; 
	signal counter			: integer range 0 to 15 := 0; 
	signal q_out			: std_logic_vector(4 downto 1);

	
	component Exercise1 is
		port(
			rst		:	in	std_logic;
			clock	:	in	std_logic;
			d		:	in	std_logic;
			q_out   :	out std_logic_vector(4 downto 1)		
		);
	end component;

begin

	clock <= not clock after 10 ns;

	INTERNAL_SIGNALS_PROCESS: process(clock)
	begin
		if rising_edge(clock) then
			if counter = 15 then
				counter <= 0;
				rst <= not rst;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	DUT : Exercise1
	port map(
		rst		=> rst,
		clock	=> clock,
		d		=> estimulo,
		q_out	=> q_out
	);
end behavioral;				
		
		