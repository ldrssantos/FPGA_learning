--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  shifit Registers  (Section5)
-- Target Device:  
-- Tool versions:  
-- Description: Create VHDL solution proposal for 74595 device 
-- https://www.ti.com/lit/ds/scls041i/scls041i.pdf?ts=1630069816185.  
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
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity Exemple1 is
    port (
        clock_50	: in  std_logic;
     	switches      : in  std_logic_vector(3 downto 0);
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