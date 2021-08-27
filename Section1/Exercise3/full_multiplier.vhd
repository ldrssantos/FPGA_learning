----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    full_multiplier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	multiplier VHDL design with data input range defined by 
--					internal generic integer
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

entity full_multiplier is
	generic(
		n: integer := 12; -- data range definition 
	);
	port(
		a		     : 	in	std_logic_vector(N-1 downto 0);
		b		     : 	in	std_logic_vector(N-1 downto 0);
		-- div_res     : 	out	std_logic_vector(N-1 downto 0);
		prod_res     : 	out	std_logic_vector(2*N-1 downto 0)
	);
end full_multiplier;

architecture behavioral of full_multiplier is	
	signal a_s   : signed(N-1 downto 0) := (others => '0');
	signal b_s   : signed(N-1 downto 0) := (others => '0');

begin
	a_s <= signed(a);
	b_s <= signed(b);
	div_res  <= std_logic_vector(a_s / b_s);
	prod_res <= std_logic_vector(a_s * b_s);
end behavioral;
