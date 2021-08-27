--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Code exemple for shifit Registers  (Section3)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: 
--				 
--			     
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

entity Exemple1 is
	port(
		rst		:	in	std_logic;
		clock	:	in	std_logic;
		d		:	in	std_logic;
		q		:	out std_logic_vector(4 downto 1)		
	);
end Exemple1;

architecture behavioral of Exemple1 is	
begin
	process(clock, rst)
	begin
		if rst = '1' then
			q <= "0000";
		elsif clock'event and clock = '1' then
			q(1) <= d;
			q(2) <= q(1);
			q(3) <= q(2);
			q(4) <= q(3);
		end if;
	end process;
end behavioral;