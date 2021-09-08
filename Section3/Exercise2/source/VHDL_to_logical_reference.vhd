----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    VHDL_to_logical_reference - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Create the Logical diagram resulting from the VHDL code
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


entity VHDL_to_logical_reference is
	generic (
		seletor   : integer := 5
	);
	port (
		clk 	  	: in std_logic;
		rst 	  	: in std_logic; 
		en 	  		: in std_logic; 
		d 	  		: in std_logic; 
		sr_output 	: out std_logic
	);
end VHDL_to_logical_reference;

architecture behavioral of VHDL_to_logical_reference is

	signal q_a 	: std_logic_vector(7 downto 0) := (others => '0');

begin
	
	process(clk, rst)
	begin
		if rst = '1' then
			q_a <= (others=>'0'); 
		elsif clk'event and clk = '1' then
			if en = '1' then
				q_a(0) <= d;
				q_a(7 downto 1) <= q_a(6 downto 0);
			end if;
		end if;
	end process;

	sr_output <= q_a(seletor);

end behavioral;