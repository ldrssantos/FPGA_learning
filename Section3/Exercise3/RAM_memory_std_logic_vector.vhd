----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    RAM_memory_inout_std_logic_vector - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Create VHDL solution proposal RAM memory 
--                  with an input and output address
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


entity RAM_memory_std_logic_vector is
	port (
		clk 	 : in std_logic;
		rst 	 : in std_logic; 

		data_in  : in std_logic_vector(7 downto 0);
		addr_in  : in std_logic_vector(7 downto 0);
		wr_i	 : in std_logic;

		data_out : out std_logic_vector(7 downto 0);
		addr_out : in std_logic_vector(7 downto 0);
		rd_error : out std_logic;
		oe_i 	 : in std_logic
	);
end RAM_memory_std_logic_vector;

architecture behavioral of RAM_memory_std_logic_vector is

	type vector_of_vector is array (7 downto 0) of std_logic_vector(7 downto 0);

	-- Default RAM data structure
	signal ram : vector_of_vector := (others => (others=>'0'));

begin
	
	process(clk, rst)
	begin
		if rst = '1' then 
			rd_error <= '0';
			data_out(7 downto 0) <= (others => '0');
			
		elsif clk'event and clk = '1' then
			if wr_i = '1' then
				ram(to_integer(unsigned(addr_in))) <= data_in;
			else
				if oe_i = '1' then
					data_out <= ram(to_integer(unsigned(addr_out)));
					rd_error <= '0';
				else
					data_out <= (others => '0');
					rd_error <= '1';
				end if;
			end if;
		end if;
	end process;
end behavioral;