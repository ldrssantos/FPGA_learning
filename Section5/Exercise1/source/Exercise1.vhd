----------------------------------------------------------------------------------
-- Company: 
-- oegineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    Reduced RAM_memory Behavioral Design 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	 
--
-- Dependoecies: 	RAM_memory_inout_simple_std_logic_vector.vhd (Section3)
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

entity Exercise1 is
	Port (
		clk 	 : in std_logic;
		rst 	 : in std_logic; 
		
		mem3_data_inout : inout std_logic_vector(7 downto 0);
		mem3_addr_inout : in std_logic_vector(7 downto 0);
		mem3_wr_i	 	: in std_logic;
		mem3_oe_i 		: in std_logic
	);
end Exercise1;

architecture behavioral of Exercise1 is

	component RAM_memory_inout_simple_std_logic_vector is
		port (
			clk 	 	: in std_logic;
			rst 	 	: in std_logic; 

			data_inout  : inout std_logic_vector(7 downto 0);
			addr_inout  : in std_logic_vector(7 downto 0);
			wr_i	 	: in std_logic;
			oe_i 	 	: in std_logic
		);
	end component;
	
begin

	RAM_MEM3 : RAM_memory_inout_simple_std_logic_vector
	port map(
		clk 	 	=> clk,
		rst 	 	=> rst,
		data_inout  => mem3_data_inout,
		addr_inout  => mem3_addr_inout,
		wr_i	 	=> mem3_wr_i,
		oe_i 	 	=> mem3_oe_i 		 
	);

end behavioral;				
		
		