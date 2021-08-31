--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  VHDL code for Exercise1  (Section6)
-- Target Device:  
-- Tool versions:  
-- Description: Change the previous resolution to a new LED vector(5 positions), 
-- check each pin mapping on Altera pinplanner 
-- and Map this new element. 
-- NOTE: verify technical documentation and user guide.
-- 
-- Dependencies: 
--				 			     
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity Exercise1 is
    port (
        clock_50	: in  std_logic;
     	switches    : in  std_logic_vector(4 downto 0);
        leds        : out std_logic_vector(4 downto 0)
    );
end Exercise1;

architecture rtl of Exercise1 is

begin
	process(clock_50)
		begin
			if clock_50'event and clock_50 = '1' then
				leds <= switches;
			end if;
	end process;
end rtl;