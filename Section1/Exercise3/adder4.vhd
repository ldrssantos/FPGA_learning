----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    adder4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Full adder(4bits) VHDL design with input and output carrier
--					and overflow
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

entity adder4 is
	port(
		a		     : 	in	std_logic_vector(3 downto 0);
		b		     : 	in	std_logic_vector(3 downto 0);
		cin			 : 	in	std_logic;

		add_res	     : 	out	std_logic_vector(3 downto 0);
		cout		 :	out	std_logic;
		add_overflow : 	out	std_logic;	
	);
end adder4;

architecture behavioral of adder4 is
	component full_adder is
		port(
			a , b , cin		: 	in	std_logic;
			add_res, cout	:	out	std_logic
		);
	end component;
	
	signal cout_s   : std_logic_vector(3 downto 0) := (others => '0');

begin
	full_adder0: port map(
		a   	=> a(0)
		b   	=> b(0),
		cin		=> cin,
		add_res => add_res(0),
		cout 	=> cout_s(0)
	);
	
	full_adder1: port map(
		a   	=> a(1)
		b   	=> b(1),
		cin		=> cout_s(0),
		add_res => add_res(1),
		cout 	=> cout_s(1)
	);

	full_adder2: port map(
		a   	=> a(2)
		b   	=> b(2),
		cin		=> cout_s(1),
		add_res => add_res(2),
		cout 	=> cout_s(2)
	);

	full_adder3: port map(
		a   	=> a(3)
		b   	=> b(3),
		cin		=> cout_s(2),
		add_res => add_res(3),
		cout 	=> cout_s(3)
	);
	
	add_overflow <= cout_s(2) XOR cout_s(3);
	cout <= cout_s(3);
end behavioral;
