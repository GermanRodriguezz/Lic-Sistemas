package Parciales;

import tp2.ejercicio1.BinaryTree;

public class ParcialAB1raFecha2026 {
	public static int diferenciaHojasInternos(BinaryTree<Integer> ab) {
		int retorno = 0;
		if (ab != null && !ab.isEmpty()) {
			
			retorno = recorrer(ab);
			
		}
		
		return retorno;
	}
	
	private static int recorrer(BinaryTree<Integer> ab) {
		int suma = 0;
		if (ab.isLeaf()) {
			if (ab.getData() % 2  == 0) {
				suma+= ab.getData();
			}
			return suma;
		}
		
		if (ab.hasLeftChild() && ab.hasRightChild() && ab.getData() % 2 != 0) {
			suma-= ab.getData();	//si cumple esta condicion resto a lo que ya acumule
		}
		// aca empiezo a propagar la recursion
		// pregunto independientemente porque quizas puedo no tener los dos hijos siempre
		if (ab.hasLeftChild()) {	
			suma+= recorrer(ab.getLeftChild());
		}
		if (ab.hasRightChild()) {
			suma+= recorrer(ab.getRightChild());
		}
		return suma;
	}
}
