----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leandro Santos
-- 
-- Create Date:    10:56:33 07/31/2021 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Counter design for Implementation test on device
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

-- Counter
entity counter is
    port (
        CLK_in      : in std_logic;
		rst			: in std_logic;
		stop		: in std_logic;
        led         : out std_logic_vector(3 downto 0)
    );
end counter;

architecture rtl of counter is

    signal iCounter : unsigned(28 downto 0);
	
begin
    -- Counter process
    COUNT_SHIFT: process (clk_in)
    begin
		if rst = '1' then
			iCounter <= (others => '0');
		elsif CLK_in'event and CLK_in = '1' then
            if stop = '0' then 
				iCounter <= iCounter - 1;
			else                           
				iCounter <= iCounter + 1;
            end if;
        end if;
    end process;
	
	led <= std_logic_vector(iCounter(iCounter'high downto iCounter'high - 3));

end rtl;

