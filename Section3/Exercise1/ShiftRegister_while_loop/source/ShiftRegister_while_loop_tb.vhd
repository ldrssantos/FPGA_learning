--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  ShiftRegister
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY ShiftRegister_while_loop_tb IS
END ShiftRegister_while_loop_tb;
 
ARCHITECTURE Testbench OF ShiftRegister_while_loop_tb IS 
 
	-- Component Declarations for the Design Under Test (DUT)
 	COMPONENT ShiftRegister_while_loop
	  generic (
		 sr_depth : integer := 7
	  );
	  port (
		 clk 		: in std_logic;
		 rst 		: in std_logic; 
		 enable 	: in std_logic;
		 sr_in 	: in std_logic;
		 sr_out 	: out std_logic
	  );
	END COMPONENT;

	--Inputs
   signal clk 		: std_logic := '0';
   signal rst 		: std_logic := '1';
   signal enable 	: std_logic := '0';
   signal sr_in 	: std_logic := '1';

 	--Outputs
   signal sr_while_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1 us;
 
BEGIN
	rst <= '0' after clk_period * 5;
	enable <= '1' after clk_period * 10;
	sr_in  <= '0' after clk_period * 20;
 
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
  DUT_SR_WL: ShiftRegister_while_loop PORT MAP (
		clk => clk,
		rst => rst,
		enable => enable,
		sr_in => sr_in,
		sr_out => sr_while_out
  );

END;
