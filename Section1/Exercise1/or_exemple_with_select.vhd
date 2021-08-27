----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 08/14/2021 
-- Design Name: 
-- Module Name:    or_exemple_with_select - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Or_example VHDL behavioral design with process...case syntax
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity or_exemple_with_select is

	port(
		input_port	: 	in	std_logic_vector(3 downto 0);
		output_port	:	out	std_logic
	);
end or_exemple_with_select;

architecture behavioral of or_exemple_with_select is

begin
	with input_port select output_port <=
		'0' when "0000",
		'1' when others;
end behavioral;