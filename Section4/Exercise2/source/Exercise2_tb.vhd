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
-- Dependencies: 
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

entity Exercise2_tb is
end Exercise2_tb;

architecture behavioral of Exercise2_tb is

	signal clock 			: std_logic := '0';
	signal estimulo_vector 	: std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        	: std_logic;
	
	signal rst				: std_logic := '0'; 
	signal en 				: std_logic := '1';
	signal counter			: integer range 0 to 15 := 0; 
	signal sr_output		: std_logic;

	
	component Exercise2 is
		generic(
		data_out_selector : integer := 7
		);
		port(
			rst			:	in	std_logic;
			en			:	in	std_logic;
			clock		:	in	std_logic;
			d			:	in	std_logic;
			sr_output   :	out	std_logic	
		);
	end component;

begin

	clock <= not clock after 10 ns;

	INTERNAL_SIGNALS_PROCESS: process(clock)
	begin
		if rising_edge(clock) then
			case counter is
				when 7|9 =>
					en <= not en;
					counter <= counter + 1;

				when 15 =>
					rst <= not rst;
					counter <= 0;

				when others =>
					counter <= counter + 1;
			end case;
		end if;
	end process;
	
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	DUT : Exercise2
	port map(
		rst			=> rst,
		en			=> en,
		clock		=> clock,
		d			=> estimulo,
		sr_output	=> sr_output
	);
end behavioral;				
		
		