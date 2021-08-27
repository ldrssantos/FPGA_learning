--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Code Exercise for PLL  (Section8)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: PLL_example.vhd
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

entity Exercise1 is
  port (
    clk_50M  			: in std_logic;
    rst      			: in std_logic; 
    counter_stop_ctrl 	: in std_logic; 
	led_clk_125M		: out std_logic_vector(3 downto 0);
	led_clk_100M		: out std_logic_vector(3 downto 0);
	led_clk_25M			: out std_logic_vector(3 downto 0);
	led_clk_10M			: out std_logic_vector(3 downto 0)
  );
end Exercise1;

architecture behavioral of Exercise1 is	   
	signal clk_125M 	: std_logic;
	signal clk_100M		: std_logic;
	signal clk_25M		: std_logic;
	signal clk_10M		: std_logic;
	signal locked_sig   : std_logic;

-- Component Declarations for the Design Under Test (DUT)
 	COMPONENT counter is
    port (
        CLK_in      : in std_logic;
		rst			: in std_logic;
		stop		: in std_logic;
        led         : out std_logic_vector(3 downto 0)
    );
	END COMPONENT;
	
	COMPONENT Pll_exemple IS
	PORT
	(
		areset	: IN STD_LOGIC  := '0';
		inclk0	: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		c1		: OUT STD_LOGIC ;
		c2		: OUT STD_LOGIC ;
		c3		: OUT STD_LOGIC ;
		locked	: OUT STD_LOGIC 
	);
	END COMPONENT;

begin
	Pll_exemple_inst : Pll_exemple PORT MAP (
		areset	=> rst,
		inclk0	=> clk_50M,
		c0	 	=> clk_125M,
		c1		=> clk_100M,
		c2	 	=> clk_25M,
		c3	 	=> clk_10M,
		locked	 => locked_sig
	);

	counter_clk_125M_inst : counter  PORT MAP (
        CLK_in  => clk_125M,
		rst     => not locked_sig,
		stop	=> counter_stop_ctrl,
        led     => led_clk_125M
    );

	counter_clk_100M_inst : counter  PORT MAP (
        CLK_in  => clk_100M,
		rst     => not locked_sig,
		stop	=> counter_stop_ctrl,
        led    	=> led_clk_100M
    );
	
	counter_clk_25M_inst : counter  PORT MAP (
        CLK_in  => clk_25M,
		rst     => not locked_sig,
		stop	=> counter_stop_ctrl,
        led 	=> led_clk_25M
    );
	
	counter_clk_10M_inst : counter  PORT MAP (
        CLK_in  => clk_10M,
		rst     => not locked_sig,
		stop	=> counter_stop_ctrl,
        led		=> led_clk_10M
    );
end behavioral;