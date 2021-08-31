--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  TestBench for Exercise4 (Section6)
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

entity Exercise4_tb is
end Exercise4_tb;

architecture TestBench of Exercise4_tb is	
	component counterupdown is
    port (
        clock_50    	 	: in  std_logic;
		rst				 	: in  std_logic;
		counter_load_value  : in  std_logic_vector(3 downto 0);
		counter_load    	: in  std_logic;
		counter_en		 	: in  std_logic;
		counter_ud		 	: in  std_logic;
		counter_out      	: out std_logic_vector(3 downto 0)
    );
	end component;
	
	signal clock_50    	 		: std_logic := '0';
	signal clock_counter_en		: std_logic := '0';
	signal rst				 	: std_logic := '1';
	signal counter_load_value	: std_logic_vector(3 downto 0) :=  "1010";
	signal counter_out			: std_logic_vector(3 downto 0);
	signal counter_load    		: std_logic := '0';
	signal counter_en		 	: std_logic := '0';
	signal counter_ud		 	: std_logic := '0';
	
	signal counter				: integer range 0 to 31 := 31; 

	
begin
	
	rst <= '0' after 140 ns;
	
	clock_50 <= not clock_50 after 10 ns;
	
	counter_en <= not counter_en after 160 ns;
		
	process(counter_en)
	begin
		if rising_edge(counter_en) then
			if rst = '0' then
				if counter = 31 then
					counter <= 0;
				else
					counter <= counter + 1;
				end if;
			
				if (counter = 31 or counter = 14) then 
					counter_ud <= not counter_ud;
				end if;
			end if;
		end if;
	end process;
		
	counter_load <= '1' when (counter >= 4 and counter <= 7) else '0';

	DUT : counterupdown
    port map(
        clock_50    	 	=> clock_50,
		rst				 	=> rst,
		counter_load_value  => counter_load_value,
		counter_load    	=> counter_load,
		counter_en		 	=> counter_en,
		counter_ud		 	=> counter_ud,
		counter_out      	=> counter_out      	
    );
end TestBench;