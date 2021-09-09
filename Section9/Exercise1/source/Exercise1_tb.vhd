--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Design testbench for Exemple1 VHDL codes (Section9)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: Exemple4.vhd (Section3)
--				 
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

entity Exercise1_tb is
end Exercise1_tb;

architecture behavioral of Exercise1_tb is

	signal rst					: std_logic := '1'; 
	signal clk_50M 				: std_logic := '0';
	signal counter_ctrl			: std_logic := '0';
	signal counter_interaction	: std_logic := '0';
	
	
	signal increment_counter_i	: std_logic := '0';
	signal decrement_counter_i	: std_logic := '0';
	signal input_enable			: std_logic := '0';
	
	signal output_enable		: std_logic;
	signal overflow_debug_o		: std_logic;

	signal st_machine_debug_o	: std_logic_vector(3 downto 0);
	
	signal delay_counter  	 	: integer range 0 to 10;

	component Exercise1 is
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
	end component;

begin

	clk_50M <= not clk_50M after 10 ns;
	rst <= '0' after 100 ns;

	INTERACTION_PROCESS: process(clk_50M)
	begin
		if rising_edge(clk_50M) then
			counter_interaction <= not counter_interaction;
		end if;
	end process;
	
	increment_counter_i <= counter_interaction when counter_ctrl = '0' else '0';
	decrement_counter_i <= counter_interaction when counter_ctrl = '1' else '0';
	
	
	COUNTER_CTRL_PROCESS: process(overflow_debug_o, output_enable)
	begin
		if (rising_edge(overflow_debug_o) or (rising_edge(output_enable))) then
			counter_ctrl <= not counter_ctrl;
		end if;
	end process;
	
	
	INPUT_ENABLE_PROCESS: process(clk_50M)
	begin
		if rising_edge(clk_50M) then
			if (to_integer(unsigned(st_machine_debug_o)) = 5) then
				if delay_counter = 5 then
					delay_counter <= 0;
				else
					delay_counter <= delay_counter + 1;
				end if;
			end if;
		end if;
	end process;
	
	input_enable <= '1' when (delay_counter >= 2 and delay_counter <= 4) else '0';
	
	DUT : Exercise1
	generic map(
		max_counter	=> 50,
		th_e 	=> 10,
		th_ge 	=> 20,
		th_gf 	=> 30,
		th_f 	=> 40
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
		
		