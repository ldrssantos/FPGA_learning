--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Design testbench for Exercise3 VHDL codes (Section3)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: 
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

architecture Testbench of Exercise1_tb is

	signal clock 				: std_logic := '0';
	signal counter_stop_ctrl	: std_logic := '0';
	signal rst					: std_logic := '1';
	
	signal counter				: integer range 0 to 19 := 0; 
	
	signal led_clk_125M 		: std_logic_vector(3 downto 0);
	signal led_clk_100M			: std_logic_vector(3 downto 0);
	signal led_clk_25M			: std_logic_vector(3 downto 0);
	signal led_clk_10M			: std_logic_vector(3 downto 0);
	
	component Exercise1 is
	port (
		clk_50M  			: in std_logic;
		rst      			: in std_logic; 
		counter_stop_ctrl 	: in std_logic; 
		led_clk_125M		: out std_logic_vector(3 downto 0);
		led_clk_100M		: out std_logic_vector(3 downto 0);
		led_clk_25M			: out std_logic_vector(3 downto 0);
		led_clk_10M			: out std_logic_vector(3 downto 0)
	);
	end component;
begin

	clock <= not clock after 10 ns;
	rst <= '0' after 100 ns;
	
	INTERNAL_SIGNALS_PROCESS: process(clock)
	begin
		if rising_edge(clock) then 
			if counter = 19 then
				counter <= 0;
				counter_stop_ctrl <= not counter_stop_ctrl;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;

	DUT : Exercise1 port map (
		clk_50M  			=> clock,
		rst      			=> rst,
		counter_stop_ctrl 	=> counter_stop_ctrl,
		led_clk_125M		=> led_clk_125M,
		led_clk_100M		=> led_clk_100M,
		led_clk_25M			=> led_clk_25M,
		led_clk_10M			=> led_clk_10M	
	);
end;				
		
		