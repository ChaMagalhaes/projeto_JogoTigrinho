programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u

	
	inteiro sorteioMoeda = 0, sorteioDado = 0
	inteiro tigrinho = 0, fazendeiro = 0
	
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
						u.aguarde(5000)
						limpa()

						faca{
							
						escreva("Quem joga primeiro?\n\n" + 
						"Escolha um lado da moeda:\n1) Cara\n2) Coroa\n\n> ")
						leia(caraCoroa)
						se((caraCoroa == "1" e moeda() == falso)){
							escreva("Que sorte caiu cara! você irá começar")
						}senao se((caraCoroa == "2" e moeda() == verdadeiro)){
							escreva("Que sorte caiu coroa! você irá começar")
						}senao{
							escreva("Tigrinho irá começar")
						}

						u.aguarde(3000)
						limpa()
						}enquanto(caraCoroa != "1" e caraCoroa!= "2")
						
					pare
				
					caso '2':
						selecaoMenu = 2
					pare
					
					caso '3':
						selecaoMenu = 3
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
 * @POSICAO-CURSOR = 1849; 
 * @DOBRAMENTO-CODIGO = [15, 25];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {sorteioMoeda, 8, 9, 12}-{sorteioDado, 8, 27, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */