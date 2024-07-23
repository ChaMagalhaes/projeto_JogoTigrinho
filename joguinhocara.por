programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		cadeia matriz[3][20]
		inteiro T=6, F=0
		inteiro dado=0

		dado=u.sorteia(1, 6)
		para(inteiro linha=0; linha<3; linha++){
			para(inteiro coluna=0; coluna<20; coluna++){
				se(linha==1){
				matriz[linha][coluna]=tp.inteiro_para_cadeia(coluna+1, 10)
				}
					se(linha==0 ){
					matriz[linha][coluna]="T"
					}senao se(linha==2){
				 		matriz[linha][coluna]="F"
					}se(linha==1){
						escreva(" [", matriz[linha][coluna], "] ")
					}senao{
				escreva(matriz[linha][coluna], " ")
				}
			}
			escreva("\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 364; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {matriz, 8, 9, 6}-{dado, 10, 10, 4};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */