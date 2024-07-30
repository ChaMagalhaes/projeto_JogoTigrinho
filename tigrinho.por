programa
{
	inclua biblioteca Sons --> s
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u

	
	inteiro sorteioMoeda = 0, sorteioDado = 0
	inteiro tigrinho = 1, fazendeiro = 1
	logico turnoJogador
	inteiro pontosT = 0, pontosF = 0
	
	funcao inicio()
	{	
		
		menu()
	}

	funcao logico moeda(){
		sorteioMoeda = u.sorteia(0, 1)

		se(sorteioMoeda == 0){
			retorne falso // cara
		}senao{
			retorne verdadeiro //coroa
		}
	}

	funcao inteiro dado(){
		
		sorteioDado = u.sorteia(1, 6) //dado 1 de 6

		retorne sorteioDado
	}
	
	funcao inteiro menu(){
		
		caracter selecao 
		cadeia opcao, caraCoroa
		inteiro selecaoMenu = 0
		logico repete = falso


		faca{
			escreva("ESCOLHA TIPO DE JOGO\n\n" +
			"1) JOGAR\n" +
			"2) VERIFICAR PLACAR\n" +
			"3) SAIR\n\n" +
			"> ")
		
			leia(opcao) //selecaoMenu
		
			se(t.numero_caracteres(opcao) == 1){
				selecao = tp.cadeia_para_caracter(opcao)

				repete = falso
				escolha(selecao){
					caso '1':
						u.aguarde(1500)
						limpa()
						
						escreva("Objetivo do Jogo:\n\n" + 
						"Como fazendeiro, seu objetivo é chegar à casa 20 antes do tigrinho para proteger o seu trigo precioso.\n" +
						"Role os dados, avance pelo tabuleiro e supere obstáculos. Vença a corrida e garanta seu trigo.\n" +
						"Boa sorte!")
						
						u.aguarde(5500)
						limpa()

						faca{
							escreva("Quem joga primeiro?\n\n" + 
							"Escolha um lado da moeda:\n1) Cara\n2) Coroa\n\n> ")
							leia(caraCoroa)
							
							u.aguarde(2500)
							limpa()
						
							se((caraCoroa == "1" e moeda() == falso) ou (caraCoroa == "2" e moeda() == verdadeiro)){
								escreva("Que sorte! você irá começar")
								
								turnoJogador = verdadeiro
								u.aguarde(3500)
								limpa()
								
								tabuleiro()
							}senao{
								escreva("Que pena você perdeu! O Tigrinho irá começar")
	
								turnoJogador = falso
								u.aguarde(3500)
								limpa()
								
								tabuleiro()
							}
						}enquanto(caraCoroa != "1" e caraCoroa!= "2")
					pare
				
					caso '2':
						placar(pontosT, pontosF)
					pare
					
					caso '3':
						repete = verdadeiro
					pare
					
					caso contrario:
						limpa()
						escreva("Escolha invalida")
					pare
				}
			}senao{
				limpa()
				escreva("Escolha inexistente")
			}
			
			u.aguarde(3500)
			limpa()
			
		}enquanto(repete == falso)
		
		retorne selecaoMenu
	}

	funcao tabuleiro(){
		cadeia jogarDado
		
		fazendeiro = 1
		tigrinho = 1
		
		escreva("JOGO INICIADOOOO! Prepare-se\n\n")
		
		faca{
			//tabuleiro
			para(inteiro i = 1; i <= 20; i++){
				se(fazendeiro == i e tigrinho == i){
					escreva("[T/F] ")
				}senao se(fazendeiro == i){
					escreva("[F] ")
				}senao se(tigrinho == i){
					escreva("[T] ")
				}senao{
					escreva(i,"  ")	
				}
			}
			u.aguarde(5000)
			limpa()
			
			se(turnoJogador == verdadeiro){
				escreva("Turno do Fazendeiro/Jogador!\n\n")
				turnoJogador = falso

				faca{
					jogarDado = "" // resetando a escolha do usuario
					
					escreva("1) Jogar dado\n" +
					"2) Desistir do jogo\n\n> ")
					leia(jogarDado)
					limpa()
					
					se(jogarDado == "1"){
						dado()
						fazendeiro += sorteioDado
						escreva("Você tirou [", sorteioDado,"]\n\n")
						obstaculo(fazendeiro, "Fazendeiro")
					}senao se(jogarDado == "2"){
						tigrinho = 20
					}senao{
						escreva("Opção escolhida não existe")
						u.aguarde(2500)
						limpa()
					}
				}enquanto(jogarDado != "1" e jogarDado != "2")
			}senao{
				escreva("Turno do Tigrinho! ")
				turnoJogador = verdadeiro
				dado()
				tigrinho += sorteioDado
				escreva("ele tirou [", sorteioDado, "].\n\n")
				obstaculo(tigrinho, "Tigrinho")
				u.aguarde(2500)
			}
		}enquanto(tigrinho <  20 e fazendeiro < 20)
		
		se(tigrinho >= 20){
			limpa()
			escreva("Tigrinho ficou com todo seu trigo!")
			u.aguarde(3500)
			pontosT += 1
		}senao{
			limpa()
			escreva("Você conseguiu proteger seu trigo!")
			u.aguarde(3500)
			pontosF += 1
		}
		limpa()
		placar(pontosT, pontosF)
		u.aguarde(3000)
	}

	funcao obstaculo(inteiro x, cadeia y){

		escolha(x){
			caso 2:
				escreva(y, " está tão motivado que correu para casa 5\n\n")
				se(turnoJogador == falso){
					fazendeiro += 3
				}senao{
					tigrinho += 3
				}
				u.aguarde(3500)
			pare

			caso 3:
				inteiro dadoExtra = 0
			
				escreva(y," Achou um atalho nos matos e agora ganha um dado extra para rolar de 1 a 3!\n\n")
				se(turnoJogador == falso){
					dadoExtra = u.sorteia(1, 3)
					escreva("Você tirou [",dadoExtra,"]\n\n")
					fazendeiro += dadoExtra
				}senao{
					dadoExtra = u.sorteia(1, 3)
					escreva("Tigrinho tirou [",dadoExtra,"]\n\n")
					tigrinho += dadoExtra 
				}
				u.aguarde(3500)
			pare

			caso 7:
				se(turnoJogador == falso){
					escreva("QUE SORTEE! O Tigrinho caiu na armadilha e agora está fora de ação no próximo turno!\n\n")
					turnoJogador = verdadeiro
				}senao{
					escreva("O Fazendeiro caiu na cilada e vai ter que ficar fora do jogo no próximo turno!\n\n")
					turnoJogador = falso
				}
				u.aguarde(3500)
			pare

			caso 10:
				escreva(y," usou troca de lugar!\n\n")
				se(turnoJogador == falso){
					inteiro trocar
					
					trocar = fazendeiro
					fazendeiro = tigrinho
					tigrinho = trocar
				}senao{
					inteiro trocar
					
					trocar = tigrinho
					tigrinho = fazendeiro
					fazendeiro = trocar
				}
				u.aguarde(3500)
			pare

			caso 12:
				escreva("O ",y, " tropeçou e voltou uma casa\n\n")
				se(turnoJogador == falso){
					fazendeiro--
				}senao{
					tigrinho--	
				}
				u.aguarde(3500)
			pare

			caso 15:
				escreva("O pato forrozeiro apareceu e quer um show! Cante um trecho da sua música favorita ou, se for tímido, volte 2 casas.\n\n")
				
				se(turnoJogador == falso){
					cadeia cantarVoltar
					inteiro som = s.carregar_som("./assents/musica/toqueMusica.mp3")
				
					faca{
						escreva("Faça sua escolha:\n" +
						"1) Cantar ou\n"+
						"2) Voltar 2 casas?\n\n> ")
						leia(cantarVoltar)
						limpa()
						
						se(cantarVoltar == "1"){
							s.reproduzir_som(som, verdadeiro)
							s.definir_volume(400)

							para(inteiro i = 15; i>=0; i--){ //contador de 15 segundos para começar o ritmo
								se(i == 0){
									escreva("VAIIIIIIIIII\n\n")
									u.aguarde(2200)
								}senao{
									escreva(i)
									u.aguarde(1000)
									limpa()
								}	
							}
							limpa()
							
							escreva("Ela é amiga da minha mulher\n" +
							"Pois é, pois é\n" +
							"Mas vive dando em cima de mim\n" +
							"Enfim, enfim\n\n")
							
							u.aguarde(10000)
							limpa()
							
		          			escreva("Ainda por cima é uma tremenda gata\n" +
							"Pra piorar minha situação\n" +
							"Se fosse mulher feia, tava tudo certo\n" +
							"Mulher bonita mexe com meu coração\n\n")
							
							u.aguarde(8000)
							limpa()
							
							escreva("Se fosse mulher feia, tava tudo certo\n" +
							"Mulher bonita mexe com meu coração\n")
							
							u.aguarde(5000)
							s.interromper_som(som)
							s.liberar_som(som)
							limpa()
						}senao se(cantarVoltar == "2"){
							fazendeiro -= 2
						}senao{
							escreva("Opção escolhida não existe")
							u.aguarde(2500)
							limpa()
						}
					}enquanto(cantarVoltar != "1" e cantarVoltar != "2")
					
				}senao{
					se(u.sorteia(1, 10) >= 7){
						tigrinho -= 2
						escreva("Tigrinho está tímido e preferiu voltar 2 casas.\n\n")
						u.aguarde(4000)
					}senao{
						escreva("Tigrinho vai dar um show!!")
						u.aguarde(4000)
						limpa()
						
						inteiro som = s.carregar_som("./assents/musica/IaCantando.mp3")
						s.reproduzir_som(som, falso)
						s.definir_volume(400)
						u.aguarde(30000)
						s.interromper_som(som)
						s.liberar_som(som)
					}
				}
			pare

			caso 19:
				escreva("O ",y, " ficou cansado volte uma casa\n\n")
				se(turnoJogador == falso){
					fazendeiro --
				}senao{
					tigrinho --
				}
				u.aguarde(3500)
				limpa()
			pare
			
		}
	}

	funcao placar(inteiro x, inteiro y){
		
		limpa()
		escreva("		PLACAR\n" +
		"------------------------------------------\n\n" +
		"Tigrinho: [",x,"]              Fazendeiro [",y,"]\n\n"+
		"-------------------------------------------"
		)
	}

	funcao textoRegra(){
		escreva("Detalhes do percurso:\n\n" +
		"O percurso deve ter 20 casas totais. Ambos os jogadores começam na casa 1.\n" +
		"O dado que sorteia os números para os jogadores percorrerem deve ter 6 faces, com a\n" +
		"numeração de 1 a 6.\n\n" +
		"As seguintes casas do percurso devem ter as funcionalidades descritas a seguir:\n" +
		"- casa 2: deve avançar o jogador para a casa 5.\n" +
		"- casa 3: deve jogar um dado adicional de 3 lados.\n" +
		"- casa 7: deve impedir que o jogador jogue o dado por 1 rodada.\n" +
		"- casa 10: deve trocar as casa em que os jogadores estão.\n" +
		"- casa 12: deve retroceder 1 casa.\n" +
		"- casa 15: deve cantar um trecho de uma música (na vida real) ou voltar 2 casas.\n"+
		"- casa 19: deve voltar para a casa 1.\n" +
		"- casa 20: recebe a mensagem de vencedor da partida")

		u.aguarde(20000)
		limpa()
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 7283; 
 * @DOBRAMENTO-CODIGO = [19, 29, 36, 364, 374];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {tigrinho, 10, 9, 8}-{fazendeiro, 10, 23, 10};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */