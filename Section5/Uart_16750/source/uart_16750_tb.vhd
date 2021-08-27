-- altera vhdl_input_version vhdl_2008

-- UART 16750 TB

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

-- Serial UART
entity uart_16750_tb is
end uart_16750_tb;

architecture behavioral of uart_16750_tb is
    -- UART transmitter
    component uart_16750 is
		Generic (
			mode422_enable : integer := 0
		);
		port (
			CLK         : in std_logic;                             -- Clock
			RST         : in std_logic;                             -- Reset
			BAUDCE      : in std_logic;                             -- Baudrate generator clock enable
			CS          : in std_logic;                             -- Chip select
			WR          : in std_logic;                             -- Write to UART
			RD          : in std_logic;                             -- Read from UART
			A           : in std_logic_vector(2 downto 0);          -- Register select
			RDV			: out std_logic;							-- Read Data Valid
			RDWAIT		: out std_logic;							-- Read Data WAIT
			DIN         : in std_logic_vector(7 downto 0);          -- Data bus input
			DOUT        : out std_logic_vector(7 downto 0);         -- Data bus output
			DDIS        : out std_logic;                            -- Driver disable
			INTQ        : out std_logic;                            -- Interrupt output
			OUT1N       : out std_logic;                            -- Output 1
			OUT2N       : out std_logic;                            -- Output 2
			RCLK        : in std_logic;                             -- Receiver clock (16x baudrate)
			BAUDOUTN    : out std_logic;                            -- Baudrate generator output (16x baudrate)
			RTSN        : out std_logic;                            -- RTS output
			DTRN        : out std_logic;                            -- DTR output
			CTSN        : in std_logic;                             -- CTS input
			DSRN        : in std_logic;                             -- DSR input
			DCDN        : in std_logic;                             -- DCD input
			RIN         : in std_logic;                             -- RI input
			SIN         : in std_logic;                             -- Receiver input
			SOUT        : out std_logic                             -- Transmitter output
		);
    end component;

	signal CLK         : std_logic;                             -- Clock
	signal RST         : std_logic;                             -- Reset
	signal BAUDCE      : std_logic;                             -- Baudrate generator clock enable
	signal CS          : std_logic;                             -- Chip select
	signal WR          : std_logic;                             -- Write to UART
	signal RD          : std_logic;                             -- Read from UART
	signal A           : std_logic_vector(2 downto 0);          -- Register select
	signal RDV		   : std_logic;							    -- Read Data Valid
	signal RDWAIT	   : std_logic;							    -- Read Data WAIT
	signal DIN         : std_logic_vector(7 downto 0);          -- Data bus input
	signal DOUT        : std_logic_vector(7 downto 0);          -- Data bus output
	signal DDIS        : std_logic;                             -- Driver disable
	signal INTQ        : std_logic;                             -- Interrupt output
	signal OUT1N       : std_logic;                             -- Output 1
	signal OUT2N       : std_logic;                             -- Output 2
	signal RCLK        : std_logic;                             -- Receiver clock (16x baudrate)
	signal BAUDOUTN    : std_logic;                             -- Baudrate generator output (16x baudrate)
	signal RTSN        : std_logic;                             -- RTS output
	signal DTRN        : std_logic;                             -- DTR output
	signal CTSN        : std_logic;                             -- CTS input
	signal DSRN        : std_logic;                             -- DSR input
	signal DCDN        : std_logic;                             -- DCD input
	signal RIN         : std_logic;                             -- RI input
	signal SIN         : std_logic;                             -- Receiver input
	signal SOUT        : std_logic;                             -- Transmitter output

	--read and write on uart
	procedure uart_bus(
		constant addr_i	   : in	std_logic_vector(7 downto 0);
		constant data_i	   : in	std_logic_vector(7 downto 0);
		constant write_i   : in std_logic;
		signal   clk       : in std_logic;
		signal   data_to_uart	: out std_logic_vector(7 downto 0);
		signal   addr_to_uart	: out std_logic_vector(2 downto 0);
		signal   cs 		    : out std_logic;
		signal   rd		        : out std_logic;
		signal   we		        : out std_logic
	) is
	begin
		wait until clk'event and clk='1';
		cs		<= '0';
		rd		<= '0';
		we		<= '0';
		data_to_uart	<= data_i(data_to_uart'range);
		addr_to_uart    <= addr_i(addr_to_uart'range);
		wait until clk'event and clk='1';
		cs		<= '1';
		rd		<= not write_i;
		we		<= write_i;
		wait until clk'event and clk='1';
		cs		<= '0';
		rd		<= '0';
		we		<= '0';
	end uart_bus;
	
	signal BAUDCLK_s   : std_logic;                             -- BAUD CLK


begin

    dut : uart_16750
		generic map(
			mode422_enable => 0
		)
		port map(
			CLK              => CLK,         -- Clock
			RST              => RST,         -- Reset
			BAUDCE           => BAUDCE,      -- Baudrate generator clock enable
			CS               => CS,          -- Chip select
			WR               => WR,          -- Write to UART
			RD               => RD,          -- Read from UART
			A                => A,           -- Register select
			RDV		         => RDV,		 -- Read Data Valid
			RDWAIT	         => RDWAIT,		 -- Read Data WAIT
			DIN              => DIN,         -- Data bus input
			DOUT             => DOUT,        -- Data bus output
			DDIS             => DDIS,        -- Driver disable
			INTQ             => INTQ,        -- Interrupt output
			OUT1N            => OUT1N,       -- Output 1
			OUT2N            => OUT2N,       -- Output 2
			RCLK             => RCLK,        -- Receiver clock (16x baudrate)
			BAUDOUTN         => BAUDOUTN,    -- Baudrate generator output (16x baudrate)
			RTSN             => RTSN,        -- RTS output
			DTRN             => DTRN,        -- DTR output
			CTSN             => CTSN,        -- CTS input
			DSRN             => DSRN,        -- DSR input
			DCDN             => DCDN,        -- DCD input
			RIN              => RIN,         -- RI input
			SIN              => SIN,         -- Receiver input
			SOUT             => SOUT         -- Transmitter output
		);
	
	--ligação obrigatória
	RCLK <= BAUDOUTN;
	
	--clock
	process
	begin
		CLK <= '1';
		wait for 5000 ps;
		CLK <= '0';
		wait for 5000 ps;
	end process;

	--baudrate
	process
	begin
		BAUDCLK_s <= '1';
		wait for 54253 ps;
		BAUDCLK_s <= '0';
		wait for 54253 ps;
	end process;
	
	--baudrate to enables
	process(clk)
		variable tmp_v : std_logic := '0';
	begin
		if clk'event and clk = '1' then
			BAUDCE <= BAUDCLK_s and not tmp_v;
			tmp_v := BAUDCLK_s;
		end if;
	end process;

	process
	begin
		rst <= '1';
		--sinais de controle
		CTSN  <= '1'; -- CTS input
		DSRN  <= '1'; -- DSR input
		DCDN  <= '1'; -- DCD input
		RIN   <= '1'; -- RI input
	
		wait until clk'event and clk='1';
		wait until clk'event and clk='1';
		rst <= '0';
		wait until clk'event and clk='1';
		
		--Configura a uart0.
		--scrap test
		uart_bus(X"07",X"E5",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"07",X"E5",'0',clk,DIN,A,CS,RD,WR);

		--registro 1, DLAB = '0'
		--todas IRQ on.
		uart_bus(X"01",X"0f",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"01",X"0f",'0',clk,DIN,A,CS,RD,WR);

		--registro 2
		uart_bus(X"02",X"A1",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"02",X"A1",'0',clk,DIN,A,CS,RD,WR);

		--Registro 3. Seta DLAB
		uart_bus(X"03",X"83",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"03",X"83",'0',clk,DIN,A,CS,RD,WR);

		--Registro 0, DLAB = 1
		uart_bus(X"00",X"05",'1',clk,DIN,A,CS,RD,WR); --rate
		uart_bus(X"00",X"05",'0',clk,DIN,A,CS,RD,WR);
		
		--Registro 1, DLAB = 1
		uart_bus(X"01",X"00",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"01",X"00",'0',clk,DIN,A,CS,RD,WR);

		uart_bus(X"03",X"03",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"03",X"03",'0',clk,DIN,A,CS,RD,WR);

		--escreve dados no buffer da uart0
		uart_bus(X"00",X"B5",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"00",X"A4",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"00",X"C3",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"00",X"10",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"00",X"FF",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"00",X"00",'1',clk,DIN,A,CS,RD,WR);
		uart_bus(X"00",X"81",'1',clk,DIN,A,CS,RD,WR);

		wait;
		
	end process;
	
	--loop
	SIN <= SOUT;
	
	
end behavioral;


