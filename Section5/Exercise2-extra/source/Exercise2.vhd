--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  shifit Registers  (Section5)
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

entity Exercise2 is
	port(
		clk_50M     :	in	std_logic;
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
end Exercise2;

architecture behavioral of Exercise2 is	
	signal q_data 		 : std_logic_vector(7 downto 0);
	signal rclk_int_vec	 : std_logic_vector(7 downto 0);
	signal srclk_int_vec : std_logic_vector(7 downto 0);
	signal rclk_int  	 : std_logic;
	signal srclk_int 	 : std_logic;
begin

	INTERNAL_CLK : process(clk_50M, srclr_n_i)
	begin
		if srclr_n_i = '1' then
			rclk_int_vec <= (others => '0');
			srclk_int_vec <= (others => '0');
			
		elsif rising_edge(clk_50M) then
			rclk_int_vec(0) <= rclk;
			rclk_int_vec(7 downto 1) <= rclk_int_vec(6 downto 0);
			rclk_int <= rclk_int_vec(0) and (not rclk_int_vec(1));
			
			srclk_int_vec(0) <= srclk;
			srclk_int_vec(7 downto 1) <= srclk_int_vec(6 downto 0);
			srclk_int <= srclk_int_vec(0) and (not srclk_int_vec(1));
		end if;
	end process;
	
	process(clk_50M)
		begin
			if clk_50M'event and clk_50M = '1' then
				if srclk_int = '1' then
					if srclr_n_i = '1' then
						q_data <= q_data(6 downto 0) & ser;
					else
						q_data <= (others => '0');
					end if;
				end if;
			end if;
	end process;
	
	process(clk_50M, oe_n_i)
		begin
			if oe_n_i = '1' then
				qa_o <= 'Z';
				qb_o <= 'Z';
				qc_o <= 'Z';
				qd_o <= 'Z';
				qe_o <= 'Z';
				qf_o <= 'Z';
				qg_o <= 'Z';
				qh_o <= 'Z';
			elsif clk_50M'event and clk_50M = '1' then
				if rclk_int = '1' then
					qa_o <= q_data(0);
					qb_o <= q_data(1);
					qc_o <= q_data(2);
					qd_o <= q_data(3);
					qe_o <= q_data(4);
					qf_o <= q_data(5);
					qg_o <= q_data(6);
					qh_o <= q_data(7);
				end if;
			end if;
	end process;
	
	qh1_o <= q_data(7);

end behavioral;