----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    ShiftRegister_while_loop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Shift Register with while loop process
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity ShiftRegister_while_loop is
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
end ShiftRegister_while_loop;


architecture Behavioral of ShiftRegister_while_loop is
	signal sr : std_logic_vector(sr_depth downto 0) := (others => '0');
begin
 	process(clk, rst)
		variable i : integer := 1;
	begin
		if rst = '1' then
			sr_out <= '0';
			sr <= (others => '0');
			i:= 1;
			
		elsif rising_edge(clk) then
			i := 1;	
			if enable = '1' then
				sr(sr'low) <= sr_in;

				while i <= sr_depth loop
					sr(i) <= sr(i - 1);
					i := i + 1;
				end loop;

				sr_out <= sr(sr'high);
			end if;
		end if;
	end process;
end Behavioral;