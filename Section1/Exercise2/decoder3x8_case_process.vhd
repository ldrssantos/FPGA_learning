----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    Decoder3x8_case_process - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Decoder3x8 VHDL design using case and process syntax
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

entity Decoder3x8_case_process is

	port(
		sel			: 	in	std_logic_vector(2 downto 0);
		output_port	:	out	std_logic_vector(7 downto 0)
	);
end Decoder3x8_case_process;

architecture behavioral of Decoder3x8_case_process is
begin
 	Decoder3x8: PROCESS (sel)
    begin
		case sel is
			when "000" =>   output_port <= "00000001";
			when "001" =>   output_port <= "00000010";
			when "010" =>   output_port <= "00000100";
			when "011" =>   output_port <= "00001000";
			when "100" =>   output_port <= "00010000";
			when "101" =>   output_port <= "00100000";
			when "110" =>   output_port <= "01000000";
			when "111" =>   output_port <= "10000000";
			when others =>  output_port <= "00000000";
		end case;
    end PROCESS;

end behavioral;
