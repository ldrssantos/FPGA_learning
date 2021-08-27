--Exemplo.
--Esse será um OR REDUTOR. Ele pega todas as entradas e faz um OR entre todas.
--Exemplo que usará GENERIC e FOR.
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

--declaramos a entidade
entity modelo_ram_tb is
end modelo_ram_tb;

--a arquitetura
architecture behavioral of modelo_sr_tb is

	----------------------------Mexer------------------------------
	--declarar sinais para ligar a entidade aqui.

begin

	----------------------------Mexer------------------------------

	--gerar sinal de relógio
	
	--colocar o componente da RAM aqui.
	
	--Criar um processo para andar com endereço e dado. Exemplo abaixo.
	--trocar we pelo sinal de gravação escolhido.
	process
	begin
		ram_addr     <= (others=>'0');
		ram_data_in  <= (others=>'0');
		ram_we       <= '0';
		--exemplo escrita
		ram_addr     <= x"ADD0"; --ajustar para o tamanho certo de vetor.
		ram_data_in  <= x"DAD0";
			ram_we       <= '1';
			wait for 30 ns;
			ram_we       <= '0';
		--exemplo leitura
		ram_addr     <= x"ADD1";
			wait for 30 ns;
		wait;
	end process;

end behavioral;				
		
		