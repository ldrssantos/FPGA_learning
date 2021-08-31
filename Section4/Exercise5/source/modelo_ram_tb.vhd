--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Design testbench for Exercise5 VHDL codes (Section4)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: 
--				 
--				 
--			     
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
--------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity modelo_ram_tb is
end modelo_ram_tb;

architecture behavioral of modelo_ram_tb is

	component Exercise5 is
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
	end component;
	
	
	signal	clk 	 		: std_logic := '0';
	signal	rst 	 		: std_logic := '1'; 
	signal	mem1_data_in  	: std_logic_vector(7 downto 0) := (others => '0');
	signal	mem1_addr_in  	: std_logic_vector(7 downto 0) := (others => '0');
	signal	mem1_wr_i	 	: std_logic := '0';
	signal	mem1_data_out 	: std_logic_vector(7 downto 0) := (others => '0');
	signal	mem1_addr_out 	: std_logic_vector(7 downto 0) := (others => '0');
	signal	mem1_rd_error 	: std_logic := '0';
	signal	mem1_oe_i 	    : std_logic := '0';
			
	signal	mem2_data_inout : std_logic_vector(7 downto 0) := (others => '0');
	signal	mem2_addr_in  	: std_logic_vector(7 downto 0) := (others => '0');
	signal	mem2_addr_out  	: std_logic_vector(7 downto 0) := (others => '0');
	signal	mem2_wr_i	 	: std_logic := '0';
	signal	mem2_oe_i   	: std_logic := '0';

	signal	mem3_data_inout : std_logic_vector(7 downto 0) := (others => '0');
	signal	mem3_addr_inout : std_logic_vector(7 downto 0) := (others => '0');
	signal	mem3_wr_i	 	: std_logic := '0';
	signal	mem3_oe_i 		: std_logic := '0';
	
	signal counter			: integer range 0 to 15 := 15; 
	
	type vector_of_vector is array (7 downto 0) of std_logic_vector(7 downto 0);
	constant rom : vector_of_vector := (
		x"AA",
		x"55",
		x"10",
		x"16",
		x"44",
		x"00",
		x"FF",
		x"FC");

begin

	clk <= not clk after 10 ns;
	rst <= '0' after 100 ns;

	INTERNAL_SIGNALS_PROCESS: process(clk)
	begin
		if rising_edge(clk) then
			case counter is
				when 0|1|2|3|4|5|6|7 =>
					mem1_wr_i <= '1';
					mem2_wr_i <= '1';
					mem3_wr_i <= '1';
					mem1_oe_i <= '0';
					mem2_oe_i <= '0';
					mem3_oe_i <= '0';
					
					mem1_data_in <= rom(counter);
					mem2_data_inout <= rom(counter);
					mem3_data_inout <= rom(counter);
					
					mem1_addr_in <= std_logic_vector(to_unsigned(counter, mem1_addr_in'length));
					mem2_addr_in <= std_logic_vector(to_unsigned(counter, mem2_addr_in'length));
					mem3_addr_inout <= std_logic_vector(to_unsigned(counter, mem3_addr_inout'length));
					
					counter <= counter + 1;
				
				when 8|9|10|11|12|13|14|15 =>
					mem1_wr_i <= '0';
					mem2_wr_i <= '0';
					mem3_wr_i <= '0';
					mem1_oe_i <= '1';
					mem2_oe_i <= '1';
					mem3_oe_i <= '1';
					
					mem1_data_in 	<= (others => '0');
                    mem2_data_inout <= (others => 'Z');
					mem3_data_inout <= (others => 'Z');
					
					mem1_addr_out <= std_logic_vector(to_unsigned((counter - 8), mem1_addr_in'length));
					mem2_addr_out <= std_logic_vector(to_unsigned((counter - 8), mem2_addr_in'length));
					mem3_addr_inout <= std_logic_vector(to_unsigned((counter - 8), mem3_addr_inout'length));

					if counter = 15 then
						counter <= 0;
					else
						counter <= counter + 1;
					end if;

				when others =>
					counter <= 0;
			end case;
		end if;
	end process;

	DUT : Exercise5
		Port map(
			clk 	        => clk,
			rst 	        => rst,
			mem1_data_in  	=> mem1_data_in,
			mem1_addr_in  	=> mem1_addr_in,
			mem1_wr_i	 	=> mem1_wr_i,
			mem1_data_out 	=> mem1_data_out,
			mem1_addr_out 	=> mem1_addr_out,
			mem1_rd_error 	=> mem1_rd_error,
			mem1_oe_i 	    => mem1_oe_i,
			mem2_data_inout => mem2_data_inout,
			mem2_addr_in  	=> mem2_addr_in	,
			mem2_addr_out  	=> mem2_addr_out,
			mem2_wr_i	 	=> mem2_wr_i,
			mem2_oe_i   	=> mem2_oe_i,
			mem3_data_inout => mem3_data_inout,
			mem3_addr_inout => mem3_addr_inout,
			mem3_wr_i	 	=> mem3_wr_i,
			mem3_oe_i 		=> mem3_oe_i
		);
end behavioral;				
		
		