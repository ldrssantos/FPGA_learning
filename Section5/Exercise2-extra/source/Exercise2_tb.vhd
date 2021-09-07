--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  TestBench for Exercise2  (Section5)
-- Target Device:  
-- Tool versions:  
-- Description: Create VHDL solution proposal for 74595 device 
-- https://www.ti.com/lit/ds/scls041i/scls041i.pdf?ts=1630069816185.  
-- 
-- Dependencies: 
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

entity Exercise2_tb is
end Exercise2_tb;

architecture TestBench of Exercise2_tb is	
	component Exercise2 is
		port(
			oe_n_i		:	in	std_logic;
			qa_o		:	out	std_logic;
			qb_o		:	out	std_logic;
			qc_o		:	out	std_logic;
			qd_o		:	out	std_logic;
			qe_o		:	out	std_logic;
			qf_o		:	out	std_logic;
			qg_o		:	out	std_logic;
			qh_o		:	out	std_logic;
			qh1_o		:	out	std_logic;
			rclk		:	in	std_logic;
			ser			:	in	std_logic;
			srclk		:	in	std_logic;
			srclr_n_i 	:	in	std_logic
		);
	end component;
	
	signal oe_n_i		: std_logic := '0';
	signal qa_o			: std_logic := '0';
	signal qb_o			: std_logic := '0';
	signal qc_o			: std_logic := '0';
	signal qd_o			: std_logic := '0';
	signal qe_o			: std_logic := '0';
	signal qf_o			: std_logic := '0';
	signal qg_o			: std_logic := '0';
	signal qh_o			: std_logic := '0';
	signal qh1_o		: std_logic := '0';
	signal rclk			: std_logic := '0';
	signal ser			: std_logic := '0';
	signal srclk		: std_logic := '0';
	signal srclr_n_i 	: std_logic := '0';
	
	signal counter		: integer range 0 to 15 := 15; 

	
begin
	
	srclk <= not srclk after 10 ns;
	
	process(srclk)
	begin
		if rising_edge(srclk) then
			if counter = 15 then
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	srclr_n_i <= '1' when (counter >= 0 and counter <= 12) else '0';
	
	rclk <= not srclk when (counter >= 1 and counter <= 13) else '0';
	
	ser <= '1' when (counter = 0 or counter = 11) else '0';
	
	oe_n_i <= '1' when (counter >= 10 and counter <= 12) else '0';
	
	DUT : Exercise2 
	port map(
		oe_n_i		=> oe_n_i,
		qa_o		=> qa_o,
		qb_o		=> qb_o,
		qc_o		=> qc_o,
		qd_o		=> qd_o,
		qe_o		=> qe_o,
		qf_o		=> qf_o,
		qg_o		=> qg_o,
		qh_o		=> qh_o,
		qh1_o		=> qh1_o,
		rclk		=> rclk,
		ser			=> ser,
		srclk		=> srclk,
		srclr_n_i 	=> srclr_n_i
	);	
end TestBench;