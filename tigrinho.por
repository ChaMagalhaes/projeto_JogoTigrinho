programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u

	
	inteiro sorteioMoeda = 0, sorteioDado = 0
	inteiro tigrinho = 0, fazendeiro = 0
	
	funcao inicio()
	{
		
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
						selecaoMenu = 2
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
 * @POSICAO-CURSOR = 497; 
 * @DOBRAMENTO-CODIGO = [15, 25, 32];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */