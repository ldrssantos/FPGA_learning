----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    Decoder3x8_if_process - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Decoder3x8 VHDL design using if and process syntax
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

entity Decoder3x8_if_process is

	port(
		sel			: 	in	std_logic_vector(2 downto 0);
		output_port	:	out	std_logic_vector(7 downto 0)
	);
end Decoder3x8_if_process;

architecture behavioral of Decoder3x8_if_process is
begin
   Decoder3x8: PROCESS (sel)
    begin
		if sel = "000" then 
			output_port <= "00000001";
		elsif sel ="001" then 
			output_port <= "00000010";
		elsif sel ="010" then 
			output_port <= "00000100";
		elsif sel ="011" then
			output_port <= "00001000";
		elsif sel ="100" then	
			output_port <= "00010000";
		elsif sel ="101" then	
			output_port <= "00100000";
		elsif sel ="110" then	
			output_port <= "01000000";
		elsif sel ="111" then	
			output_port <= "10000000";
		else
			output_port <= "00000000";
		end if;
    end PROCESS;

end behavioral;
