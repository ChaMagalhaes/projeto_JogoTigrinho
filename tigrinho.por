programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u

	
	inteiro sorteioMoeda = 0, sorteioDado = 0
	inteiro tigrinho = 0, fazendeiro = 0
	cadeia pista[3][20]
	
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
		cadeia opcao
		inteiro selecaoMenu = 0
		logico repete = falso


		faca{
			escreva("ESCOLHA TIPO DE JOGO\n\n" +
			"1) UM JOGADOR\n" +
			"2) DOIS JOGADORES\n" +
			"3) VERIFICAR PLACAR\n" +
			"4) SAIR\n\n" +
			"> ")
		
			leia(opcao)
		
			se(t.numero_caracteres(opcao) == 1){
				selecao = tp.cadeia_para_caracter(opcao)
				repete = falso
			
				escolha(selecao){
					caso '1':
						selecaoMenu = 1
					pare
				
					caso '2':
						se(moeda() == verdadeiro){
							escreva("Jogador 1 será o Tigrinho!\n")
							escreva("Jogador 2 será o Fazenderio!\n ")
						}senao{
							escreva("Jogador 1 será o Fazendeiro!\n")
							escreva("Jogador 2 será o Tigrinho!")

							u.aguarde(1700)
							limpa()
							
							escreva("Jogando a moeda!\n")
							se(moeda() == falso){
								escreva("Jogador 2 começara\n")
								logico jogada = falso
								faca{
									dado()
									se(jogada == falso){
										escreva("Jogador 2 tirou: ", dado(), " no dado.")
										tigrinho += dado()
										jogada = verdadeiro
									}senao{
										escreva("Jogador 1 tirou: ", dado(), " no dado.")
										fazendeiro += dado()
										jogada = falso
									}
									
									para(inteiro i = 1; i <= 20; i++){
										se(tigrinho == i e fazendeiro == i){
											escreva("[T,F]")
										}senao se(fazendeiro == i){
											escreva("[F]")
										}senao se(tigrinho == i){
											escreva("[T]")
										}senao{
											escreva(" ",i," ")
										}
									}
									u.aguarde(3000)
									limpa()
									
								}enquanto(tigrinho <= 20 e fazendeiro <= 20)
							}senao{
								escreva("Jogador 1 começara")
							}
							
						}
						

						escreva("Jogando a moeda!")
						se(moeda() == falso){
							escreva("Jogador 2 começara")

							faca{
								dado()
								escreva("Jogador 2 tirou: ", sorteioDado, " no dado.")
								
							}enquanto(tigrinho <= 20 ou fazendeiro <= 20)
							
						}senao{
							escreva("Jogador 1 começara")
						}
						

						
						
					pare
					
					caso '3':
						selecaoMenu = 3
					pare
				
					caso '4':
						selecaoMenu = 4
					pare
					
					caso contrario:
						escreva("Escolha invalido")
						repete = verdadeiro
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
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1742; 
 * @DOBRAMENTO-CODIGO = [16];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */