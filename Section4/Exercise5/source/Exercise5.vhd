----------------------------------------------------------------------------------
-- Company: 
-- oegineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    Full RAM_memory Behavioral Design 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	 
--
-- Dependoecies: 	RAM_memory_inout_simple_std_logic_vector.vhd (Section3)
--					RAM_memory_inout_std_logic_vector.vhd (Section3)
--					RAM_memory_std_logic_vector.vhd (Section3)
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Commoets: 
--
----------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity Exercise5 is
	Port (
		clk 	 : in std_logic;
		rst 	 : in std_logic; 
		
		mem1_data_in  	: in std_logic_vector(7 downto 0);
		mem1_addr_in  	: in std_logic_vector(7 downto 0);
		mem1_wr_i	 	: in std_logic;
		mem1_data_out 	: out std_logic_vector(7 downto 0);
		mem1_addr_out 	: in std_logic_vector(7 downto 0);
		mem1_rd_error 	: out std_logic;
		mem1_oe_i 	    : in std_logic;
		
		mem2_data_inout : inout std_logic_vector(7 downto 0);
		mem2_addr_in  	: in std_logic_vector(7 downto 0);
		mem2_addr_out  	: in std_logic_vector(7 downto 0);
		mem2_wr_i	 	: in std_logic;
		mem2_oe_i   	: in std_logic;

		mem3_data_inout : inout std_logic_vector(7 downto 0);
		mem3_addr_inout : in std_logic_vector(7 downto 0);
		mem3_wr_i	 	: in std_logic;
		mem3_oe_i 		: in std_logic
		
	);
end Exercise5;

architecture behavioral of Exercise5 is
	component RAM_memory_std_logic_vector is
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
	end component;
	
	
	component RAM_memory_inout_std_logic_vector is
		port (
			clk 	 	: in std_logic;
			rst 	 	: in std_logic; 

			data_inout  : inout std_logic_vector(7 downto 0);
			addr_in  	: in std_logic_vector(7 downto 0);
			addr_out  	: in std_logic_vector(7 downto 0);
			wr_i	 	: in std_logic;
			oe_i 	 	: in std_logic
		);
	end component;

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
	RAM_MEM1 : RAM_memory_std_logic_vector
	port map (
		clk 	 => clk, 
		rst 	 => rst,
		data_in  => mem1_data_in,
		addr_in  => mem1_addr_in,
		wr_i	 => mem1_wr_i,
		data_out => mem1_data_out,
		addr_out => mem1_addr_out,
		rd_error => mem1_rd_error,
		oe_i 	 => mem1_oe_i 	
	);


	RAM_MEM2 : RAM_memory_inout_std_logic_vector
	port map(
		clk 	 	=> clk,
		rst 	 	=> rst,
		data_inout  => mem2_data_inout,
		addr_in  	=> mem2_addr_in,
		addr_out  	=> mem2_addr_out,
		wr_i	 	=> mem2_wr_i,
		oe_i 	 	=> mem2_oe_i
	);

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
		
		