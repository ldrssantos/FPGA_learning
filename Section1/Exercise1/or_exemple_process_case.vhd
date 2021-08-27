----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 08/14/2021 
-- Design Name: 
-- Module Name:    or_exemple_process_case - Behavioral 
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

entity or_exemple_process_case is

	port(
		input_port	: 	in	std_logic_vector(3 downto 0);
		output_port	:	out	std_logic
	);
end or_exemple_process_case;

architecture behavioral of or_exemple_process_case is

begin
	or_exemple: PROCESS (input_port)
    begin
		case input_port is
			when "0000" => output_port <= '0';
			when others => output_port <= '1';
		end case;
    end PROCESS;
end behavioral;