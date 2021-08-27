--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Design testbench for all OR_example VHDL codes (Section1)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: All Design files for Section1 -> Exercise1
--				 or_exemple_process_case.vhd
--				 or_exemple_when_else.vhd
--			     or_exemple_with_select.vhd
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

entity full_or_example_tb is
end full_or_example_tb;

architecture sim of full_or_example_tb is
	signal clock1			: std_logic := '0';
	signal nCS				: std_logic := '0'; 

	signal counter			: integer range 0 to 15 := 0; 

	signal input_port_s		: std_logic_vector(3 downto 0) := (others => '0');
	signal pc_output_port_s	: std_logic := '0';
	signal we_output_port_s	: std_logic := '0';
	signal ws_output_port_s	: std_logic := '0';
	
	component Exercise2
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
	end component;


begin

	clock1 <= not clock1 after 10 ns;

	INTERNAL_SIGNALS_PROCESS: process
	begin
		nCS <= not nCS;

		if counter = 15 then
			counter <= 0;
		else
			counter <= counter + 1;
		end if;
		
		wait until clock1 = '1';
		wait until clock1 = '0';
	end process;

	Internal_signal: process(nCS, counter, clock1)
	begin
		if ncs = '1' then
			input_port_s <= (others=>'0');
		else
			input_port_s <= std_logic_vector(to_unsigned(counter, 4));
		end if;
	end process;
		
	DUT :  Exercise2
		port map(
			pc_input_port	=> input_port_s, 
			pc_output_port	=> pc_output_port_s, 
			we_input_port	=> input_port_s, 
			we_output_port	=> we_output_port_s, 
			ws_input_port	=> input_port_s, 
			ws_output_port	=> ws_output_port_s  
		);
end sim;