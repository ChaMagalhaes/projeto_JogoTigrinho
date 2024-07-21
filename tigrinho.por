programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u

	
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
		
		sorteioDado = u.sorteia(1, 6)

		retorne sorteioDado
	}
	
	funcao inteiro menu(){
		caracter x
		cadeia selecao
		inteiro selecaoMenu = 0
		logico repete = falso

		faca{
			
		escreva("ESCOLHA TIPO DE JOGO\n\n" +
		"1) UM JOGADOR\n" +
		"2) DOIS JOGADORES\n" +
		"3) VERIFICAR PLACAR\n" +
		"4) SAIR\n\n")
			
		leia(selecao)

		se(t.numero_caracteres(selecao) == 1){

		x = tp.cadeia_para_caracter(selecao)
			
			escolha(x){
			caso '1':
				escreva("Um jogador")
				selecaoMenu = 1
			pare
			caso '2': 
				escreva("Dois Jogador")
				selecaoMenu = 2
			pare
			caso '3':
				escreva("Verificar Placar")
				selecaoMenu = 3
			pare
			caso '4':
				escreva("Sair")
				selecaoMenu = 4
				
			pare
			caso contrario:
				escreva("Escolha invalido")
				selecaoMenu = 0
				repete = verdadeiro
				
			pare
			
			}

		}senao{
			escreva("Escolha inexistente")
		}
			u.aguarde(2000)
			limpa()
			
		}enquanto(repete != falso)
		
		retorne selecaoMenu
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 707; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */