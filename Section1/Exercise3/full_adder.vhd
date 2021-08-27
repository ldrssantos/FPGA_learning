----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    Full-adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Full adder VHDL design with input and output carrier
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

entity full_adder is

	port(
		a , b , cin		: 	in	std_logic;
		add_res, cout	:	out	std_logic
	);
end full_adder;

architecture behavioral of full_adder is
begin
	add_res <= a XOR b XOR cin;
	cout <= (a AND b) OR (cin AND a) OR (cin AND b);
	
end behavioral;
