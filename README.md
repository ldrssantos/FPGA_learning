# Studying VHDL design flow for Intel FPGA 20.1 Lite Edition

## Section 1 
Exercise1 - Create VHDL solution proposal (logical OR with 3 inputs) using the syntax when...else, process...case, and with...select
NOTE: create a different files.

Exercise2 - Create VHDL solution proposal (Decoder3x8) using logic gates, concurrent assignment, WHEN ... ELSE, IF within PROCESS, and CASE within PROCESS
NOTE: each in different files. These files will be used later.

Exercise3 - Create VHDL solution proposal (adder and subtractor 4-bit, NO SIGNAL and 12-bits multiplier of a number of 2 numbers).
NOTE: create a different files.

## Section 2 
Exercise1 - Create new project for MODELSIM, a process to generate non-periodic signal for an 8-bit vector (passing the following values every 10ns) : “ZZZZ_ZZZZ”, "0000_0000", "1010_0100", "ZZZZ_ZZZZ"
NOTE: Simulate with an appropriate time base (100 ns).

Exercise2 - Create VHDL solution proposal for EXAMPLE 2 and its respective testbench.

Exercise3 - Use all VHDL solution proposals (Decoder3x8) and create its respective testbench.

## Section 3 
Exercise1 - Create VHDL solution proposal (Shift registers) FOR...LOOP and WHILE...LOOP.

Exercise2 - Create the Logical diagram resulting from the VHDL code below
```VHDL
process(clk, rst)
begin
	if rst = '1' then
		q_a <= (others=>'0'); 
	elsif clk'event and clk = '1' then
		if en = '1' then
			q_a(0) <= d;
			q_a(7 downto 1) <= q_a(6 downto 0);
		end if;
	end if;
end process;

sr_output <= q_a(seletor);
```
Logical diagram result below (considering seletor = 7) :
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section3/Exercise2/source/Schematic_result.jpg?raw=true)

Exercise3 - Create VHDL solution proposal RAM memory with an input and output address, an input port and an output port (all input signals must be STD_LOGIC_VECTOR), Create another RAM memory with only one input and output data port and a third RAM memory with only one input, output and address port.

Exercise4 - Describe the state machine in the following diagram (with counters,Fifo Synchronous and Generic thresholds).
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section3/Exercise4/source/StateMachine.png?raw=true)

Exercise5 - HDL Coding Practices to Accelerate Design Performance study  
Https://www.xilinx.com/support/documentation/white_papers/wp231.pdf
https://www.researchgate.net/publication/248744710_HDL_Coding_Practices_to_Accelerate_Design_Performance

## Section 4 
Exercise1 - Create VHDL testbench solution for Example1-section3 code. 
NOTE: use modelo_sr_tb.vhd Design Stimulus reference. 

Exercise2 - Create VHDL testbench solution for Example2-section3 code. 
NOTE: use modelo_sr_tb.vhd Design Stimulus reference. 

Exercise3 - Create VHDL testbench solution for Exercise1-section3 code. 
NOTE: use modelo_sr_tb.vhd Design Stimulus reference. 

Exercise4 - Create VHDL testbench solution for Example3-section3 code. 
NOTE: use modelo_sr_tb.vhd Design Stimulus reference.

Exercise5 - Create VHDL testbench solution for Exercise3-section3 code. 
NOTE: use modelo_ram_tb.vhd Design Stimulus reference.   

## Section 5 
Exercise1 - Create Quartus Prime project for RAM memory with only one port for address and data.
NOTE: use Exercise3-section3 files.

Exercise2 - Create VHDL solution proposal for 74595 device - https://www.ti.com/lit/ds/scls041i/scls041i.pdf?ts=1630069816185.

Exercise2-extra - Studing Timing Analyzer tool according Intel Quick-Start Tutorial below
https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/ug/ug_tq_tutorial.pdf

## Section 6 
Design Kit documentation - https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=163&No=502&PartNo=4

Design Kit Hands-On - https://youtu.be/RlrAdS8eaxc

Example1 - Use the switches and LEDS to implement a circuit that turns the LED on/off with the change of state of each one of them.
Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section6/Example1/source/PinPlanner-results.jpg?raw=true)

Example2 - Create VHDL solution proposal for simple counter
Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section6/Example2/source/PinMap%20-%20results.jpg?raw=true)

Exercise1 - Change the previous resolution to a new LED vector(5 positions), check each pin mapping on Altera pinplanner and Map this new element. NOTE: verify technical documentation and user guide.
Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section6/Exercise1/source/PinPlanner-results.jpg?raw=true)

Exercise2 - Use the switches to verify Decoder3x8 VHDL implementation (Exercise3-section3)
Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section6/Exercise2/source/PinMap-results.jpg?raw=true)

Exercise3 - Justify why the counter uses 29-bits

Exercise4 - Create VHDL solution proposal (4-bit counter), Selector switch for UP and DOWN, Push button to increase/decrease according to configuration
LOAD button, loads the counter with key value and turn on the counter on LEDs.
Note: use counterupdown.zip design reference 

Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section6/Exercise4/source/PinMap-results.jpg?raw=true)

## Section 7 
FPGA Architecture study - https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/wp/wp-01003.pdf

## Section 8 
Use previous Design Kit documentation

Exercise1 - Create VHDL solution proposal for COUNTER project and add a PLL(Altera IP) on it design - Include one counter for each clock.
The PLL must have 4 outputs: C0(PLL_out) - clock converter 50MHz to 125MHz, C1(PLL_out) - clock converter 50MHz to 100MHz, c2(PLL_out) - clock converter 50MHz to 25MHz and c3(PLL_out) - clock converter 50MHz to 10MHz.

Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section8/Exercise1/source/PinMap-results.jpg?raw=true)

	
## Section 9 
Use previous Design Kit documentation

Example1 - Use this EVK to verify Shift register implementations (Exercise1-section3) 

Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section9/Example1/source/PinMap-results.jpg?raw=true)

Exercise1 - Use this EVK to verify State machine implementations (Exercise4-section3)

Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section9/Exercise1/source/PinMap-results.jpg?raw=true)

Exercise2 - Use this EVK to verify RAM memory implementations (Exercise1-section5) 

Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section9/Exercise2/source/PinMap-results.jpg?raw=true)

Exercise3 - Use this EVK to verify RAM memory implementations (Exercise4-section4)

Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section9/Exercise3/source/PinMap-results.jpg?raw=true)

Exercise1-extra - Use this EVK to verify State machine implementations (Exercise3-section3)

Quartus Pin Plnner results according to Design kit documentation presented above
![Alt text](https://github.com/ldrssantos/Learning_FPGA/blob/main/Section9/Exercise1/source/PinMap-results.jpg?raw=true)
