--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Code exemple for shifit Registers  (Section3 - Example3)
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

entity Example3 is
	port(
		rst					:	in	std_logic;
		clock				:	in	std_logic;
		parallel_data		:	in	std_logic_vector(1023 downto 0);
		parallel_load_ctrl	:	in	std_logic;
		direction			:	in	std_logic;
		en					:	in	std_logic;
		shift_register_in	:	in	std_logic;
		data_force_in		:	in	std_logic;
		data_fix_in 		:	in	std_logic_vector(1 downto 0);
		shift_register_out	:	out	std_logic
	);
end Example3;

architecture behavioral of Example3 is	
	signal shift_registers : std_logic_vector(1023 downto 0);
	signal data_selected   : std_logic;
	
begin
	data_selected <= '0' when data_fix_in(0) = '1' else
				     '1' when data_fix_in(1) = '1' else
					 shift_register_in	when data_force_in = '1' else
					 shift_registers(0) when direction = '0'   else
					 shift_registers(1023);
						 
	process(clock, rst, parallel_load_ctrl, en, direction)
		begin
			if rst = '1' then
				shift_registers <= (others => '0');
			elsif clock'event and clock = '1' then
				if parallel_load_ctrl = '1' then
					shift_registers <= parallel_data;				
				end if;
								
				if en = '1' then
					if 	direction = '1' then
						shift_registers <= shift_registers(shift_registers'high-1 downto 0) & data_selected;
					else
						shift_registers <= data_selected & shift_registers(shift_registers'high downto shift_registers'low+1);
					end if;						
				end if;
			end if;
	end process;

	shift_register_out <= shift_registers(shift_registers'low) when direction = '0' else shift_registers(shift_registers'high);

end behavioral;