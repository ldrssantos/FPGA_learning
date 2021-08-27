--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Design testbench for Exercise3 VHDL codes (Section3)
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

entity Exercise3_tb is
end Exercise3_tb;

architecture Testbench of Exercise3_tb is

	signal clock 			: std_logic := '0';
	signal estimulo_vector 	: std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        	: std_logic;
	
	signal rst				: std_logic := '0'; 
	signal en 				: std_logic := '1';
	signal counter			: integer range 0 to 15 := 0; 
	signal sr_for_out		: std_logic;
	signal sr_while_out		: std_logic;

	component Exercise3 is
	generic (
		sr_depth : integer := 7
	);
	port (
		clk 		 : in std_logic;
		rst 		 : in std_logic; 
		enable 		 : in std_logic;
		sr_in 		 : in std_logic;
		sr_for_out 	 : out std_logic;
		sr_while_out : out std_logic

	);
	end component;

begin

	clock <= not clock after 10 ns;

	INTERNAL_SIGNALS_PROCESS: process(clock)
	begin
		if rising_edge(clock) then
			case counter is
				when 7|9 =>
					en <= not en;
					counter <= counter + 1;

				when 15 =>
					rst <= not rst;
					counter <= 0;

				when others =>
					counter <= counter + 1;
			end case;
		end if;
	end process;
	
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	DUT : Exercise3
	generic map (
		sr_depth     => 7
	)
	port map(
		rst		     => rst,
		enable	     => en,
		clk		     => clock,
		sr_in	     => estimulo,
		sr_for_out   => sr_for_out,
		sr_while_out => sr_while_out
	);
end;				
		
		