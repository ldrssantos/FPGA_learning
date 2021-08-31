--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Design testbench for Exercise4 VHDL codes (Section4)
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

entity Exercise4_tb is
end Exercise4_tb;

architecture Testbench of Exercise4_tb is
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

	signal estimulo_vector 		: std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        		: std_logic;
	
	signal rst					: std_logic := '1';
	signal clock				: std_logic := '0';
	signal parallel_data		: std_logic_vector(1023 downto 0) := (others => '1');
	signal parallel_load_ctrl	: std_logic:= '0';
	
	signal direction			: std_logic:= '0';
	signal en					: std_logic:= '0';
	
	signal shift_register_in	: std_logic:= '0';
	
	signal data_fix_in   		: std_logic_vector(1 downto 0) := (others => '0');
	
	signal shift_register_out	: std_logic := '0';
	signal data_force_in     	: std_logic := '1';
	
	signal counter	    : integer range 0 to 1023 := 0; 
	signal data_range	: integer range 0 to 1023 := 1023; 
	
begin

	clock <= not clock after 10 ns;

	INTERNAL_COUNTER_PROCESS: process(clock)
	begin
		if rising_edge(clock) then
			if (counter = data_range) then
					counter <= 0;
			else
					counter <= counter + 1;
			end if;
		end if;
	end process;
	
	rst <= '1' when counter = data_range else '0';
	
	data_force_in <= not data_force_in when counter = data_range;
					   
	en <= not data_force_in when counter = data_range;
	
	parallel_load_ctrl <= '1' when counter = (data_range/2) else '0';
	
	direction <= '0' when counter < (data_range/2) else '1';
	
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	DUT: Exercise4
	port map (
		rst					=> rst,
		clock				=> clock,
		parallel_data		=> parallel_data,
		parallel_load_ctrl	=> parallel_load_ctrl,
		direction			=> direction,
		en					=> en,
		shift_register_in	=> estimulo,
		data_force_in       => data_force_in,
		data_fix_in         => data_fix_in, 
		shift_register_out	=> shift_register_out
	);

end Testbench;				
		
		