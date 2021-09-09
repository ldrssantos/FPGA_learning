--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  State Machine - Behavioral (Section3)
-- Target Device:  
-- Tool versions:  
-- Description: Describe the state machine in the following diagram
--              (with counters,Fifo Synchronous and Generic thresholds).  
-- 
-- Dependencies: exercise4.vhd
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

entity Exercise1 is
	generic(
		max_counter	: integer := 50;
		
		th_e 		: integer := 10;

		th_ge 	: integer 	:= 20;

		th_gf 	: integer 	:= 30;

		th_f 	: integer 	:= 40
	);
	port(
		clk_50M     		:	in	std_logic;
		rst					:	in	std_logic;
		
		increment_counter_i	:	in	std_logic;
		decrement_counter_i	:	in	std_logic;
		
		input_enable		:	in	std_logic;
		output_enable		:	out	std_logic;
		
		overflow_debug_o	:	out	std_logic;
				
		st_machine_debug_o	:	out	std_logic_vector(3 downto 0)
	);
end Exercise1;



architecture behavioral of Exercise1 is	
	component Exercise4 is
	generic(
		max_counter	: integer := 50;
		th_e 	: integer := 10;
		th_ge 	: integer := 20;
		th_gf 	: integer := 30;
		th_f 	: integer := 40
	);
	port(
		clk_50M     		:	in	std_logic;
		rst					:	in	std_logic;
		increment_counter_i	:	in	std_logic;
		decrement_counter_i	:	in	std_logic;
		input_enable		:	in	std_logic;
		output_enable		:	out	std_logic;
		overflow_debug_o	:	out	std_logic;
		st_machine_debug_o	:	out	std_logic_vector(3 downto 0)
	);
	end component;

begin
	DUT : Exercise4 
	generic map(
		max_counter	=> max_counter,
		th_e 	=> th_e,
		th_ge	=> th_ge,
		th_gf	=> th_gf,
		th_f 	=> th_f
	)
	port map(
		clk_50M     		=> clk_50M,
		rst					=> rst,
		increment_counter_i	=> increment_counter_i,
		decrement_counter_i	=> decrement_counter_i,
		input_enable		=> input_enable,
		output_enable		=> output_enable,
		overflow_debug_o	=> overflow_debug_o,
		st_machine_debug_o	=> st_machine_debug_o
	);
end behavioral;