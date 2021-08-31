--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leandro Santos
--
-- Create Date:   11:13:38 07/31/2021
-- Design Name:   
-- Module Name:   
-- Project Name:  Wrapper Design for all decoder3x8 VHDL code options (Section1)
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- Dependencies: decoder3x8_case_process.vhd
--				 decoder3x8_if_process.vhd
--				 decoder3x8_when_else.vhd
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
        clock_50		: 	in  std_logic;
		switches		: 	in	std_logic_vector(2 downto 0);
				
		-- Signal interfaces for Decoder3x8_logic design
		-- l_output_port	:	out	std_logic_vector(7 downto 0);
		
		-- Signal interfaces for Decoder3x8_if_process design
		ip_output_port	:	out	std_logic_vector(7 downto 0);
		
		-- Signal interfaces for Decoder3x8_case_process design
		cp_output_port	:	out	std_logic_vector(7 downto 0);
		
		-- Signal interfaces for Decoder3x8_case_process design
		we_output_port	:	out	std_logic_vector(7 downto 0)
	);
end Exercise2;

architecture behavioral of Exercise2 is	
	signal switches_int : std_logic_vector(2 downto 0) := (others => '0');

	-- component Decoder3x8_logic
	--	port(
	--		sel			: 	in	std_logic_vector(2 downto 0);
	--		output_port	:	out	std_logic_vector(7 downto 0)
	--	);
	-- end component;

	component Decoder3x8_if_process
		port(
			sel			: 	in	std_logic_vector(2 downto 0);
			output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;

	component Decoder3x8_case_process
		port(
			sel			: 	in	std_logic_vector(2 downto 0);
			output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;

	component Decoder3x8_when_else
		port(
			sel			: 	in	std_logic_vector(2 downto 0);
			output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;

begin
	process(clock_50)
		begin
			if clock_50'event and clock_50 = '1' then
				switches_int <= switches;
			end if;
	end process;
	
	
	-- dc_logic_des: Decoder3x8_logic
	-- 	port map(
	-- 		sel			=> switches_int,
	-- 		output_port	=> l_output_port
	-- 	);
	
	dc_ip_des: Decoder3x8_if_process
		port map(
			sel			=> switches_int,
			output_port	=> ip_output_port
		);

	dc_cp_des: Decoder3x8_case_process
		port map(
			sel			=> switches_int,
			output_port	=> cp_output_port
		);

	dc_we_des: Decoder3x8_when_else
		port map(
			sel			=> switches_int,
			output_port	=> we_output_port
		);
end behavioral;