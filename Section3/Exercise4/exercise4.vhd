----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    State Machine - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
--
-- Description: Describe the state machine in the following diagram
--              (with counters,Fifo Synchronous and Generic thresholds).
--
-- Dependencies: 
--				 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity Exercise4 is
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
end Exercise4;


architecture behavioral of Exercise4 is
	type stateMachine_structure is (
		full,
		overflow,
		going_full,
		steady3,
		steady2,
		steady1,
		steady0
	);
	signal stateMachine : stateMachine_structure;
	
	signal internal_counter  	 : integer range 0 to max_counter;
	signal delay_counter  	     : integer range 0 to max_counter;
	
	signal increment_counter_vec : std_logic_vector(3 downto 0);
	signal decrement_counter_vec : std_logic_vector(3 downto 0);
	signal input_enable_vec      : std_logic_vector(3 downto 0);
	
	signal increment_counter_en  : std_logic;
	signal decrement_counter_en  : std_logic;
	signal internal_input_en     : std_logic;

begin
	INTERNAL_ENABLE_SIGNALS : process(rst, clk_50M)
	begin
		if rst = '1' then
			increment_counter_vec <= (others => '0');
			decrement_counter_vec <= (others => '0');
			input_enable_vec <= (others => '0');
			
		elsif rising_edge(clk_50M) then
			increment_counter_vec(0) <= increment_counter_i;
			increment_counter_vec(3 downto 1) <= increment_counter_vec(2 downto 0);
			increment_counter_en <= increment_counter_vec(0) and (not increment_counter_vec(1));
			
			decrement_counter_vec(0) <= decrement_counter_i;
			decrement_counter_vec(3 downto 1) <= decrement_counter_vec(2 downto 0);
			decrement_counter_en <= decrement_counter_vec(0) and (not decrement_counter_vec(1));
			
			input_enable_vec(0) <= input_enable;
			input_enable_vec(3 downto 1) <= input_enable_vec(2 downto 0);
			internal_input_en <= input_enable_vec(0) and (not input_enable_vec(1));
		end if;
	end process;
	
	ST_MACHINE_PROCESS : process(rst, clk_50M)
	begin
		if rst = '1' then
			stateMachine <= steady1;
			
			internal_counter <= 1;
			delay_counter <= 0;
		
		elsif rising_edge(clk_50M) then
			if increment_counter_en then
				if internal_counter < max_counter then
					internal_counter <= internal_counter + 1;
				end if;			
			elsif decrement_counter_en then
				if internal_counter > 0 then
					internal_counter <= internal_counter - 1;
				end if;			
			end if;
			
			case stateMachine is
				when steady0 =>
					if delay_counter = max_counter then
						delay_counter <= 0;
						stateMachine <= steady3;
						internal_counter <= th_ge + 1;
					else
						delay_counter <= delay_counter + 1;
						stateMachine <= steady0;
					end if;					

				when steady1 =>
					if internal_counter = 0 then
						stateMachine <= steady0;
					elsif internal_counter > th_e then
						stateMachine <= steady2;
					else
						stateMachine <= steady1;
					end if;

				when steady2 =>
					if internal_counter < th_e then
						stateMachine <= steady1;
					elsif internal_counter > th_ge then
						stateMachine <= steady3;
					else
						stateMachine <= steady2;
					end if;

				when steady3 =>
					if internal_counter < th_ge then
						stateMachine <= steady2;
					elsif internal_counter > th_gf then
						stateMachine <= going_full;
					else
						stateMachine <= steady3;
					end if;

				when going_full =>
					if internal_counter < th_gf then
						stateMachine <= steady3;
					elsif internal_counter > th_f then
						stateMachine <= full;
					else
						stateMachine <= going_full;
					end if;

				when full =>
					if ((internal_counter = max_counter) OR (internal_input_en = '1')) then
						stateMachine <= overflow;
					else
						stateMachine <= full;
					end if;

				-- for stateMachine = overflow
				when others =>
					if delay_counter = max_counter then
						delay_counter <= 0;
						stateMachine <= steady3;
						internal_counter <= th_ge + 1;
					else
						delay_counter <= delay_counter + 1;
						stateMachine <= overflow;
					end if;					
			end case;
		end if;
	end process;
	
	output_enable <= '1' when stateMachine = steady0 else '0';
	
	-- Additional debug signals section 
	overflow_debug_o <= '1' when stateMachine = overflow else '0';
	
	ST_MACHINE_DEBUG : process(stateMachine)
	begin
		case stateMachine is
			when steady0 =>
				st_machine_debug_o <= (others => '0');

			when steady1 =>
				st_machine_debug_o <= std_logic_vector(to_unsigned(1, st_machine_debug_o'length));		

			when steady2 =>
				st_machine_debug_o <= std_logic_vector(to_unsigned(2, st_machine_debug_o'length));		

			when steady3 =>
				st_machine_debug_o <= std_logic_vector(to_unsigned(3, st_machine_debug_o'length));		
			
			when going_full =>
				st_machine_debug_o <= std_logic_vector(to_unsigned(4, st_machine_debug_o'length));		
			
			when full =>
				st_machine_debug_o <= std_logic_vector(to_unsigned(5, st_machine_debug_o'length));		

			when others =>
				st_machine_debug_o <= std_logic_vector(to_unsigned(6, st_machine_debug_o'length));		

		end case;
	end process;
end behavioral;	