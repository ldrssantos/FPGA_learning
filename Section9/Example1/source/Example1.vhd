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

entity Example1 is
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
end Example1;

architecture behavioral of Example1 is	   
-- Component Declarations for the Design Under Test (DUT)
 	COMPONENT ShiftRegister_for_loop
	generic (
	sr_depth : integer := 7
	);
	PORT(
		clk_50M		: IN std_logic;
		sr_in_ctrl	: IN std_logic;
		rst 		: IN std_logic;
		en_sr 		: IN std_logic;
		sr_in 		: IN std_logic;
		sr_out 		: OUT std_logic;
	  	sr_vec_out 	: OUT std_logic_vector(sr_depth downto 0)
	  );
	END COMPONENT;

 	COMPONENT ShiftRegister_while_loop
	  generic (
		 sr_depth : integer := 7
	  );
	  port (
		clk_50M		: IN std_logic;
		sr_in_ctrl	: IN std_logic;
		rst 		: IN std_logic; 
		en_sr 		: IN std_logic;
		sr_in 		: IN std_logic;
		sr_out 		: OUT std_logic;
		sr_vec_out : OUT std_logic_vector(sr_depth downto 0)
	  );
	END COMPONENT;
	
	signal sr_in_ctrl_vec : std_logic_vector(sr_depth downto 0);
	signal en_sr_in_crtl  : std_logic;

begin
	
	EN_SR_IN_PROCESSING : process(clk_50M, rst)
	begin
		if rst = '1' then
			sr_in_ctrl_vec <= (others => '0');
			
		elsif rising_edge(clk_50M) then
			sr_in_ctrl_vec(0) <= sr_in_ctrl;
			sr_in_ctrl_vec(sr_depth downto 1) <= sr_in_ctrl_vec(sr_depth-1 downto 0);
			en_sr_in_crtl <= sr_in_ctrl_vec(0) and (not sr_in_ctrl_vec(1));
		end if;
	end process;
	
	SR_WL: ShiftRegister_while_loop 
	GENERIC MAP (
		sr_depth => sr_depth
	)
	PORT MAP (
		clk_50M => clk_50M,
		sr_in_ctrl => en_sr_in_crtl,
		rst => rst,
		en_sr => en_sr,
		sr_in => sr_in,
		sr_out => sr_while_out,
		sr_vec_out => sr_while_vec_out
	);
  
    SR_FL: ShiftRegister_for_loop 
	GENERIC MAP (
		sr_depth => sr_depth
	)
	PORT MAP (
		clk_50M => clk_50M,
		sr_in_ctrl => en_sr_in_crtl,
		rst => rst,
		en_sr => en_sr,
		sr_in => sr_in,
		sr_out => sr_for_out,
		sr_vec_out => sr_for_vec_out
	);
end behavioral;