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
-- Description: 	Shift Register with for loop process and include 
--					std_logic_vector for debugging
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
	clk_50M		: in std_logic;
	sr_in_ctrl	: in std_logic;
    rst 		: in std_logic; 
    en_sr 		: in std_logic;
    sr_in 		: in std_logic;
    sr_out 		: out std_logic;
   	sr_vec_out 	: out std_logic_vector(sr_depth downto 0)
  );
end ShiftRegister_for_loop;


architecture Behavioral of ShiftRegister_for_loop is
	signal sr : std_logic_vector(sr_depth downto 0) := (others => '0');
begin
 
	process(clk_50M, rst)
	begin
		if rst = '1' then
			sr_out <= '0';
			sr <= (others => '0');
			
		elsif rising_edge(clk_50M) then
			if sr_in_ctrl = '1' then
				if en_sr = '1' then
					sr(sr'low) <= sr_in;
					
					for i in sr'high downto sr'low + 1 loop
						sr(i) <= sr(i - 1);
					end loop;
					
					sr_out <= sr(sr'high);
				end if;
			end if;	
		end if;
	end process;
	
	sr_vec_out <= sr;

end Behavioral;