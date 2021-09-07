--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Code exemple for shifit Registers  (Section4)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: example1.vhd
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

entity Exercise1 is
	port(
		rst		:	in	std_logic;
		clock	:	in	std_logic;
		d		:	in	std_logic;
		q_out	:	out std_logic_vector(4 downto 1)		
	);
end Exercise1;

architecture behavioral of Exercise1 is	
	component Example1 is
	port(
		rst		:	in	std_logic;
		clock	:	in	std_logic;
		d		:	in	std_logic;
		q		:	out std_logic_vector(4 downto 1)		
	);
	end component;

begin
	SR : Example1
	port map(
		rst		=> rst,
		clock	=> clock,
		d		=> d,
		q		=> q_out 	
	);

end behavioral;