		architecture behavioral of mq_entity is
			
			--não atribui valor aqui pois farei isso no RESET.
			type estados is (
				closing,
				closed,
				opening,
				opened
			);
			signal mq_estados : estados;
		
		begin
		--vimos isso no início da disciplina.
		process(rst, clk)
		begin
			if rst = '1' then
				mq_estados <= opened;
			elsif clk'event and clk = '1' then
				case mq_estados is
					when opened =>
						if to_close = '1' then
							mq_estados <= closing;
						--vamos adicionar um "failsafe: se por alguma medonhice (falta de luz por exemplo)
						-- o portão estiver fechado mas a máquina entende ele como aberto, vamos pular ao
						--estado correto.
						elsif sensor = 0 then 
							mq_estados <= closed;
						end if;
					when opening =>
						if to_close = '1' then
							mq_estados <= closing;
						elsif sensor = '1' then
							mq_estados <= opened;
						end if;
					when closed =>
						if to_open = '1' then
							mq_estados <= opening;
						--mesmo caso do opened. mas aqui é menos crítico.
						elsif sensor = 1 then 
							mq_estados <= opened;
						end if;
					when closing =>
						if to_open = '1' then
							mq_estados <= opening;
						elsif sensor = '0' then
							mq_estados <= closed;
						end if;						
					when others =>
						--isso aqui é tipo um failsafe. se por algum motivo o one-hot virar "two-hot",
						--vai para estado conhecido. normalmente para o estado do reset.
						mq_estados <= opened;
				end case;
			end if;
		end process;						