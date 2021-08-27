----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    Decoder3x8_when_else - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Decoder3x8 VHDL design using when...else syntax
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity Decoder3x8_when_else is

	port(
		sel			: 	in	std_logic_vector(2 downto 0);
		output_port	:	out	std_logic_vector(7 downto 0)
	);
end Decoder3x8_when_else;

architecture behavioral of Decoder3x8_when_else is
begin
	output_port(0) <= '1' when sel = "000" else '0';
	output_port(1) <= '1' when sel = "001" else '0';
	output_port(2) <= '1' when sel = "010" else '0';
	output_port(3) <= '1' when sel = "011" else '0';
	output_port(4) <= '1' when sel = "100" else '0';
	output_port(5) <= '1' when sel = "101" else '0';
	output_port(6) <= '1' when sel = "110" else '0';
	output_port(7) <= '1' when sel = "111" else '0';
end behavioral;
