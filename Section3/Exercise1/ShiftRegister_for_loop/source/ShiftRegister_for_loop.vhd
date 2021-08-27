----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    ShiftRegister_for_loop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Shift Register with for loop process
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ShiftRegister_for_loop is
  generic (
    sr_depth : integer := 7
  );
  port (
    clk 	: in std_logic;
    rst 	: in std_logic; 
    enable 	: in std_logic;
    sr_in 	: in std_logic;
    sr_out 	: out std_logic
  );
end ShiftRegister_for_loop;


architecture Behavioral of ShiftRegister_for_loop is
	signal sr : std_logic_vector(sr_depth downto 0) := (others => '0');
begin
 
	process(clk, rst)
	begin
		if rst = '1' then
			sr_out <= '0';
			sr <= (others => '0');
			
		elsif rising_edge(clk) then
			if enable = '1' then
				for i in sr'high downto sr'low + 1 loop
					sr(i) <= sr(i - 1);
				end loop;

				sr(sr'low) <= sr_in;
				sr_out <= sr(sr'high);
			end if;
		end if;
	end process;
end Behavioral;