--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Code Exercise for shifit Registers  (Section3)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: Example2.vhd
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

entity Exercise2 is
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
end Exercise2;

architecture behavioral of Exercise2 is	
	component Example2 is
	generic(
		data_out_selector : integer := 7
	);
	port(
		rst			:	in	std_logic;
		clock		:	in	std_logic;
		d			:	in	std_logic;
		en          :	in	std_logic;
		sr_output   :	out	std_logic
	);
	end component;
	
begin

	SR : Example2 
	generic map(
		data_out_selector => data_out_selector
	)
	port map(
		rst			=> rst,
		clock		=> clock,
		en 			=> en,
		d			=> d,
		sr_output   => sr_output
	);

end behavioral;