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

				repete = verdadeiro
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
						
						u.aguarde(1500)
						limpa()
						
						se((caraCoroa == "1" e moeda() == falso) ou (caraCoroa == "2" e moeda() == verdadeiro)){
							escreva("Que sorte! você irá começar")
							u.aguarde(2000)
							limpa()
							turnoJogador = verdadeiro
							tabuleiro()
							
							
						}senao{
							escreva("Que pena você perdeu! O Tigrinho irá começar")
							u.aguarde(2000)
							limpa()
							tabuleiro()
						}

						u.aguarde(3000)
						limpa()
						}enquanto(caraCoroa != "1" e caraCoroa!= "2")
						
					pare
				
					caso '2':
						placar(pontosT, pontosF)
					pare
					
					caso '3':
						repete = falso
					pare
					
					caso contrario:
						escreva("Escolha invalido")
					pare
				}
			}senao{
				escreva("Escolha inexistente")
			}
			
			u.aguarde(2000)
			limpa()
			
		}enquanto(repete == verdadeiro)
		
		retorne selecaoMenu
	}

	funcao tabuleiro(){
		
		cadeia jogarDado
		escreva("JOGO INICIADOOOO!\n\n")
		fazendeiro = 1
		tigrinho = 1
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
				escreva("Turno do fazendeiro/Jogador\n\n")
				turnoJogador = falso
				
				faca{
					escreva("1) Jogar dado\n" +
					"2) Desistir do jogo\n\n> ")
					leia(jogarDado)
	
					se(jogarDado == "1"){
						dado()
						fazendeiro += sorteioDado
						limpa()
						escreva("Você tirou [", sorteioDado,"]\n\n")
						regras(fazendeiro)
					}senao se(jogarDado == "2"){
						tigrinho = 20
					}senao{
						escreva("\n\nOpção escolhida não existe")
						u.aguarde(2000)
						limpa()
					}
				}enquanto(jogarDado != "1" e jogarDado != "2")
				jogarDado = "" // resetando a escolha do usuario
			}senao{
				escreva("Turno do tigrinho, ")
				turnoJogador = verdadeiro
				dado()
				tigrinho += sorteioDado
				escreva("ele tirou [", sorteioDado, "].\n\n")
				regras(tigrinho)
				u.aguarde(2000)
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

	funcao regras(inteiro x){

		escolha(x){
			caso 2:
				se(turnoJogador == falso){
					fazendeiro += 3
				}senao{
					tigrinho += 3
				}
			pare

			caso 3:
				se(turnoJogador == falso){
					fazendeiro += u.sorteia(1, 3) 
				}senao{
					tigrinho += u.sorteia(1, 3) 
				}
			pare

			caso 7:
				se(turnoJogador == falso){
					turnoJogador = verdadeiro
				}senao{
					turnoJogador = falso
				}
			pare

			caso 10:
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
			pare

			caso 12:
				se(turnoJogador == falso){
					fazendeiro--
				}senao{
					tigrinho--	
				}
			pare

			caso 15:
				se(turnoJogador == falso){
					cadeia cantarVoltar
					inteiro som = s.carregar_som("musicaAmiga.mp3")
				
					faca{
						escreva("1) Quer cantar ou\n"+
						"2) voltar 2 casas?")
						leia(cantarVoltar)
						
						se(cantarVoltar == "1"){
							s.reproduzir_som(som, verdadeiro)
							s.definir_volume(50)

							limpa()

							para(inteiro i = 15; i>=0; i--){
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
						}senao se(cantarVoltar == "2"){
							fazendeiro -= 2
						}senao{
							escreva("Opção escolhida não existe")
						}
					}enquanto(cantarVoltar != "1" e cantarVoltar != "2")
				}senao{
					se(u.sorteia(1, 10) > 8){
						tigrinho -= 2
					}senao{
						inteiro som = s.carregar_som("musicaIa")
						s.reproduzir_som(som, falso)
						s.definir_volume(80)
						u.aguarde(30000)
						s.interromper_som(som)
						s.liberar_som(som)
					}
				}
			pare

			caso 19:
				se(turnoJogador == falso){
					fazendeiro -= 1
				}senao{
					tigrinho -= 1
				}
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
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3909; 
 * @DOBRAMENTO-CODIGO = [13, 18, 28, 195];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {sorteioDado, 9, 27, 11}-{tigrinho, 10, 9, 8}-{fazendeiro, 10, 23, 10};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */