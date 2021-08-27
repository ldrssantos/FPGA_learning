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

entity full_decoder3x8_tb is
end full_decoder3x8_tb;

architecture sim of full_decoder3x8_tb is
	signal clock1			: std_logic := '0';
	signal nCS				: std_logic := '0'; 

	signal counter			: integer range 0 to 7 := 0; 

	signal sel_s			: std_logic_vector(2 downto 0) := (others => '0');
	signal l_output_port_s	: std_logic_vector(7 downto 0) := (others => '0');
	signal ip_output_port_s	: std_logic_vector(7 downto 0) := (others => '0');
	signal cp_output_port_s	: std_logic_vector(7 downto 0) := (others => '0');
	signal we_output_port_s	: std_logic_vector(7 downto 0) := (others => '0');
	
	component Exercise3 is
		port(
			-- Signal interfaces for Decoder3x8_logic design
			l_sel			: 	in	std_logic_vector(2 downto 0);
			l_output_port	:	out	std_logic_vector(7 downto 0);
			
			-- Signal interfaces for Decoder3x8_if_process design
			ip_sel			: 	in	std_logic_vector(2 downto 0);
			ip_output_port	:	out	std_logic_vector(7 downto 0);
			
			-- Signal interfaces for Decoder3x8_case_process design
			cp_sel			: 	in	std_logic_vector(2 downto 0);
			cp_output_port	:	out	std_logic_vector(7 downto 0);
			
			-- Signal interfaces for Decoder3x8_case_process design
			we_sel			: 	in	std_logic_vector(2 downto 0);
			we_output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;

begin

	clock1 <= not clock1 after 10 ns;

	INTERNAL_SIGNALS_PROCESS: process
	begin
		if counter = 7 then
			counter <= 0;
			nCS <= not nCS;
		else
			counter <= counter + 1;
		end if;
		
		wait until clock1 = '1';
		wait until clock1 = '0';
	end process;

	Internal_signal: process(nCS, counter, clock1)
	begin
		if ncs = '1' then
			sel_s <= (others=>'0');
		else
			sel_s <= std_logic_vector(to_unsigned(counter, 3));
		end if;
	end process;
		
	DUT : Exercise3
		port map(
			l_sel			=> sel_s,
			l_output_port	=> l_output_port_s,
			ip_sel			=> sel_s,
			ip_output_port	=> ip_output_port_s,
			cp_sel			=> sel_s,
			cp_output_port	=> cp_output_port_s,
			we_sel			=> sel_s,
			we_output_port	=> we_output_port_s 
		);
end sim;