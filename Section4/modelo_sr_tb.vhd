--Exemplo.
--Esse será um OR REDUTOR. Ele pega todas as entradas e faz um OR entre todas.
--Exemplo que usará GENERIC e FOR.
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

--declaramos a entidade
entity modelo_sr_tb is
end modelo_sr_tb;

--a arquitetura
architecture behavioral of modelo_sr_tb is

	------------------------Não Mexer------------------------------
	signal clock := '0';
	signal estimulo_vector : std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        : std_logic;
	
	----------------------------Mexer------------------------------
	--declarar sinais para ligar a entidade aqui.

begin

	------------------------Não Mexer------------------------------
	--vamos criar um estímulo. duas partes. uma, rodar o vetor e a outra gerar o sinal "estimulo"
	--que deve ser ligado ao shift register
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	----------------------------Mexer------------------------------

	--gerar sinal de relógio chamado 'clock' aqui.
	
	--colocar o componente do seu ShiftRegister aqui.

end behavioral;				
		
		