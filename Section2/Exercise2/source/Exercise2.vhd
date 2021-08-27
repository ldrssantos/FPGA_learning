--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Full Design for all OR_example VHDL code options (Section1)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: or_exemple_process_case.vhd
--				 or_exemple_when_else.vhd
--			     or_exemple_with_select.vhd
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
	port(
		-- Signal interfaces for or_exemple_process_case design
		pc_input_port	: 	in	std_logic_vector(3 downto 0);
		pc_output_port	:	out	std_logic;
		
		-- Signal interfaces for or_exemple_when_else design
		we_input_port	: 	in	std_logic_vector(3 downto 0);
		we_output_port	:	out	std_logic;
		
		-- Signal interfaces for or_exemple_with_select design
		ws_input_port	: 	in	std_logic_vector(3 downto 0);
		ws_output_port	:	out	std_logic		
	);
end Exercise2;

architecture behavioral of Exercise2 is	
	component or_exemple_process_case
		port(
			input_port	: 	in	std_logic_vector(3 downto 0);
			output_port	:	out	std_logic
		);
	end component;

	component or_exemple_when_else
		port(
			input_port	: 	in	std_logic_vector(3 downto 0);
			output_port	:	out	std_logic
		);
	end component;

	component or_exemple_with_select
		port(
			input_port	: 	in	std_logic_vector(3 downto 0);
			output_port	:	out	std_logic
		);
	end component;
begin
	pc_design : or_exemple_process_case
		port map(
			input_port	=> pc_input_port,
			output_port	=> pc_output_port
		);
		
	we_design : or_exemple_when_else
		port map(
			input_port	=> we_input_port,
			output_port	=> we_output_port
		);

	ws_design : or_exemple_with_select
		port map(
			input_port	=> ws_input_port,
			output_port	=> ws_output_port
		);
end behavioral;