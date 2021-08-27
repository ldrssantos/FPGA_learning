----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    Decoder3x8_logic - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Decoder3x8 VHDL design using standard logic
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

entity Decoder3x8_logic is

	port(
		sel			: 	in	std_logic_vector(2 downto 0);
		output_port	:	out	std_logic_vector(7 downto 0)
	);
end Decoder3x8_logic;

architecture behavioral of Decoder3x8_logic is
begin
	output_port(0) <= not(sel(2)) and (not sel(1)) and (not sel(0)); 	-- @sel(2 downto 0) = "000";
	output_port(1) <= not(sel(2)) and (not sel(1)) and (sel(0)); 		-- @sel(2 downto 0) = "001";
	output_port(2) <= not(sel(2)) and (sel(1)) and (not sel(0)); 		-- @sel(2 downto 0) = "010";
	output_port(3) <= not(sel(2)) and (sel(1)) and (sel(0)); 			-- @sel(2 downto 0) = "011";
	output_port(4) <= sel(2) and (not sel(1)) and (not sel(0)); 		-- @sel(2 downto 0) = "100";
	output_port(5) <= sel(2) and (not sel(1)) and (sel(0)); 			-- @sel(2 downto 0) = "101";
	output_port(6) <= sel(2) and (sel(1)) and (not sel(0)); 			-- @sel(2 downto 0) = "110";
	output_port(7) <= sel(2) and sel(1) and sel(0); 					-- @sel(2 downto 0) = "111";
end behavioral;
