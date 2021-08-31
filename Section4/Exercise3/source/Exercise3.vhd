--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Code Exercise for shifit Registers  (Section3)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: ShiftRegister_for_loop.vhd
--				 ShiftRegister_while_loop.vhd  
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

entity Exercise3 is
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
end Exercise3;

architecture behavioral of Exercise3 is	   
-- Component Declarations for the Design Under Test (DUT)
 	COMPONENT ShiftRegister_for_loop
	generic (
	sr_depth : integer := 7
	);
	PORT(
		clk 	: IN  std_logic;
		rst 	: IN  std_logic;
		enable 	: IN  std_logic;
		sr_in 	: IN  std_logic;
		sr_out 	: OUT  std_logic
	  );
	END COMPONENT;

 	COMPONENT ShiftRegister_while_loop
	  generic (
		 sr_depth : integer := 7
	  );
	  port (
		 clk 		: IN std_logic;
		 rst 		: IN std_logic; 
		 enable 	: IN std_logic;
		 sr_in 		: IN std_logic;
		 sr_out 	: OUT std_logic
	  );
	END COMPONENT;

begin
	SR_WL: ShiftRegister_while_loop 
	GENERIC MAP (
		sr_depth => sr_depth
	)
	PORT MAP (
		clk => clk,
		rst => rst,
		enable => enable,
		sr_in => sr_in,
		sr_out => sr_while_out
	);
  
    SR_FL: ShiftRegister_for_loop 
	GENERIC MAP (
		sr_depth => sr_depth
	)
	PORT MAP (
		clk => clk,
		rst => rst,
		enable => enable,
		sr_in => sr_in,
		sr_out => sr_for_out
	);
end behavioral;