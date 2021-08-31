--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  VHDL code for Exemple1  (Section6)
-- Target Device:  
-- Tool versions:  
-- Description: Use the switches and LEDS to implement a circuit 
-- that turns the LED on/off with the change of state of each one of them. 
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

entity Exemple1 is
    port (
        clock_50	: in  std_logic;
     	switches    : in  std_logic_vector(3 downto 0);
        leds        : out std_logic_vector(3 downto 0)
    );
end Exemple1;

architecture rtl of Exemple1 is

begin
	process(clock_50)
		begin
			if clock_50'event and clock_50 = '1' then
				leds <= switches;
			end if;
	end process;
end rtl;