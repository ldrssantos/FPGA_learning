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
-- Description: Create VHDL solution proposal (4-bit counter), 
-- Selector switch for UP and DOWN, Push button to increase/decrease 
-- according to configuration LOAD button, loads the counter with key value 
-- and turn on the counter on LEDs. 

-- Note: use counterupdown.zip design reference
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.ALL;

entity counterupdown is
    port (
        clock_50    	 	: in  std_logic;
		rst				 	: in  std_logic;
		counter_load_value  : in  std_logic_vector(3 downto 0);
		counter_load    	: in  std_logic;
		counter_en		 	: in  std_logic;
		counter_ud		 	: in  std_logic;
		counter_out      	: out std_logic_vector(3 downto 0)
    );
end counterupdown;

architecture rtl of counterupdown is

	component debounce
		port (
			ck      : in  std_logic;
			deb_in  : in  std_logic;
			deb_out : out std_logic
		);
	end component;
    
	signal iCounter 			: integer;
	signal counter_load_int    	: std_logic;
	signal counter_en_int		: std_logic;
	
begin

	counter_load_deb : debounce
		port map(
			ck      => clock_50,
			deb_in  => counter_load,
			deb_out => counter_load_int
		);

	counter_en_deb : debounce
		port map(
			ck      => clock_50,
			deb_in  => counter_en,
			deb_out => counter_en_int
		);
		
    COUNT : process (clock_50)
    begin
		if rst = '1' then
			iCounter <= 0;
		elsif clock_50'event and clock_50 = '1' then
            if (counter_load_int = '1') then
				iCounter <= conv_integer(unsigned(counter_load_value));
			else
				if counter_en_int = '1' then
					if counter_ud = '0' then 
						iCounter <= iCounter + 1;
					else
						iCounter <= iCounter - 1;
					end if;
				end if;			
			end if;
        end if;
    end process;
	
	counter_out <= conv_std_logic_vector(iCounter, counter_out'length);
	
end rtl;