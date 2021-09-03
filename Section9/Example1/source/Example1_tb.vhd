--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Design testbench for Example1 VHDL codes (Section3)
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

entity Example1_tb is
	generic (
		sr_depth : integer := 7
	);
end Example1_tb;

architecture Testbench of Example1_tb is

	signal clk_50M 			: std_logic := '0';
	signal sr_in_ctrl		: std_logic := '0';
	signal estimulo_vector 	: std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        	: std_logic;
	
	signal rst				: std_logic := '0'; 
	signal en 				: std_logic := '1';
	signal counter			: integer range 0 to 15 := 0; 
	signal sr_for_out		: std_logic;
	signal sr_while_out		: std_logic;
	
    signal sr_for_vec_out	: std_logic_vector(sr_depth downto 0);
	signal sr_while_vec_out : std_logic_vector(sr_depth downto 0);


	component Example1 is
	generic (
		sr_depth : integer := 7
	);	
	port (
		clk_50M			 : in std_logic;
		sr_in_ctrl		 : in std_logic;
		rst 		 	 : in std_logic; 
		en_sr 		 	 : in std_logic;
		sr_in 		 	 : in std_logic;
		sr_for_out 	 	 : out std_logic;
		sr_for_vec_out	 : out std_logic_vector(sr_depth downto 0);
		sr_while_out 	 : out std_logic;
		sr_while_vec_out : out std_logic_vector(sr_depth downto 0)
	);
	end component;

begin

	clk_50M <= not clk_50M after 10 ns;
	sr_in_ctrl <= not sr_in_ctrl after 80 ns;

	INTERNAL_SIGNALS_PROCESS: process(sr_in_ctrl)
	begin
		if rising_edge(sr_in_ctrl) then
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
	
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(sr_in_ctrl);
	estimulo        <= estimulo_vector(15);

	DUT : Example1
	generic map (
		sr_depth     => sr_depth
	)
	port map(
		clk_50M		 => clk_50M,
		sr_in_ctrl   => sr_in_ctrl,
		rst		     => rst,
		en_sr	     => en,
		sr_in	     => estimulo,
		sr_for_out   	 => sr_for_out,
		sr_for_vec_out 	 => sr_for_vec_out,
		sr_while_out 	 => sr_while_out,
		sr_while_vec_out => sr_while_vec_out		
	);
end;				
		
		