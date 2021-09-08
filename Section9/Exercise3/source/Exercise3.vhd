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
--				 exercise4.vhd (section4)
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity Exercise3 is
		port(
			clk_50M     		:	in	std_logic;
			rst					:	in	std_logic;
			parallel_data		:	in	std_logic_vector(35 downto 0);
			parallel_load_ctrl	:	in	std_logic;
			direction			:	in	std_logic;
			en					:	in	std_logic;
			shift_register_in	:	in	std_logic;
			data_force_in		:	in	std_logic;
			data_fix_in 		:	in	std_logic_vector(1 downto 0);
			shift_register_out	:	out	std_logic
		);
end Exercise3;

architecture behavioral of Exercise3 is
	component Exercise4 is
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

	signal parallel_data_int_vec 	:	std_logic_vector(1023 downto 0) := (others => '0');
	-- signal internal_clk_vec 		:	std_logic_vector(7 downto 0) := (others => '0');
	
	-- signal int_clock 			: std_logic;

begin
		
	-- The DE2 115 Board provides one 40 pin expansion header. The header connects directly to 36 pins
	-- 	of the Cyclone IV E FPGA, and also provides DC +5V (VCC5), DC +3.3V (VCC3 P 3), and two
	-- GND pins. Figure 4-15 shows the I/O distribution of the GPIO connector. (Table 4-10)
	parallel_data_int_vec(35 downto 0) <= parallel_data;
		
	-- INTERNAL_CLK : process(clk_50M, rst)
	-- begin
	-- if rst = '1' then
	-- 		internal_clk_vec <= (others => '0');

	-- elsif rising_edge(clk_50M) then
	-- 		internal_clk_vec(0) <= rclk;
	-- 		internal_clk_vec(7 downto 1) <= internal_clk_vec(6 downto 0);
	-- 		int_clock <= internal_clk_vec(0) and (not internal_clk_vec(1));
	-- end if;
	-- end process;
	
	
	Full_SR: Exercise4
	port map (
		rst					=> rst,
		clock				=> clk_50M,
		parallel_data		=> parallel_data_int_vec,
		parallel_load_ctrl	=> parallel_load_ctrl,
		direction			=> direction,
		en					=> en,
		shift_register_in	=> shift_register_in,
		data_force_in       => data_force_in,
		data_fix_in 	    => data_fix_in,
		shift_register_out	=> shift_register_out
	);
end behavioral;				
		
		