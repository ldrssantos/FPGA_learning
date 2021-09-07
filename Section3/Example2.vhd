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

entity Example2 is
	generic(
		data_out_selector : integer := 7
	);
	port(
		rst			:	in	std_logic;
		clock		:	in	std_logic;
		d			:	in	std_logic;
		en 			:	in	std_logic;
		sr_output   :	out	std_logic
	);
end Example2;

architecture behavioral of Example2 is	
	signal q_a : std_logic_vector(7 downto 0);
begin
	process(clock, rst)
		begin
			if rst = '1' then
				q_a <= (others=>'0'); 
			elsif clock'event and clock = '1' then
				if en = '1' then
					q_a(0) <= d;
					q_a(7 downto 1) <= q_a(6 downto 0);
				end if;
			end if;
	end process;

	sr_output <= q_a(data_out_selector);

end behavioral;