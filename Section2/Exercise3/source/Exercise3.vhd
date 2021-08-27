--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Wrapper Design for all decoder3x8 VHDL code options (Section1)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: decoder3x8_case_process.vhd
--				 decoder3x8_if_process.vhd
--			     decoder3x8_logic.vhd.vhd
--				 decoder3x8_when_else.vhd
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

entity Exercise3 is
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
end Exercise3;

architecture behavioral of Exercise3 is	
	component Decoder3x8_logic
		port(
			sel			: 	in	std_logic_vector(2 downto 0);
			output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;

	component Decoder3x8_if_process
		port(
			sel			: 	in	std_logic_vector(2 downto 0);
			output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;

	component Decoder3x8_case_process
		port(
			sel			: 	in	std_logic_vector(2 downto 0);
			output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;

	component Decoder3x8_when_else
		port(
			sel			: 	in	std_logic_vector(2 downto 0);
			output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;

begin
	dc_logic_des: Decoder3x8_logic
		port map(
			sel			=> l_sel,
			output_port	=> l_output_port
		);
	
	dc_ip_des: Decoder3x8_if_process
		port map(
			sel			=> ip_sel,
			output_port	=> ip_output_port
		);

	dc_cp_des: Decoder3x8_case_process
		port map(
			sel			=> cp_sel,
			output_port	=> cp_output_port
		);

	dc_we_des: Decoder3x8_when_else
		port map(
			sel			=> we_sel,
			output_port	=> we_output_port
		);
end behavioral;