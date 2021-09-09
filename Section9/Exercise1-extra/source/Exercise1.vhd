----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Shift register full control design
--
-- Dependencies: Full_shift_registers.vhd (Section3)
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity Exercise1 is
		port(
			rst					:	in	std_logic;
			clk_50M				:	in	std_logic;
			parallel_data_in	:	in	std_logic_vector(13 downto 0);
			parallel_load_ctrl	:	in	std_logic;
			direction			:	in	std_logic;
			en					:	in	std_logic;
			shift_register_in	:	in	std_logic;
			data_force_in		:	in	std_logic;
			data_fix_in 		:	in	std_logic_vector(1 downto 0);
			shift_register_out	:	out	std_logic
		);
end Exercise1;

architecture behavioral of Exercise1 is

	signal parallel_data		: std_logic_vector(1023 downto 0) := (others => '0');
	
	component Example3 is
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
	end component;
begin
	EN_SR_IN_PROCESSING : process(clk_50M, rst)
	begin
		if rst = '1' then
			parallel_data <= (others => '0');
			
		elsif rising_edge(clk_50M) then
			parallel_data(13 downto 0) <= parallel_data_in;
		end if;
	end process;
	
	
	Full_SR: Example3
		port map (
			rst					=> rst,
			clock				=> clk_50M,
			parallel_data		=> parallel_data,
			parallel_load_ctrl	=> parallel_load_ctrl,
			direction			=> direction,
			en					=> en,
			shift_register_in	=> shift_register_in,
			data_force_in       => data_force_in,
			data_fix_in 	    => data_fix_in,
			shift_register_out	=> shift_register_out
		);
end behavioral;				
		
		