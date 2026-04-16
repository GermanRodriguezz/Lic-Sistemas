package tp2.ejercicio7;

import tp2.ejercicio1.BinaryTree;

public class ParcialArboles {
	private BinaryTree<Integer> ar;
	
	public boolean isLeftTree(int num) {
		return buscar(num,ar);
	}
	
	public boolean buscar(int n, BinaryTree<Integer> a) {
	/*lo primero que buscamos es encontrar el numero dentro del arbol*/
		if (a.getData() != n) {
			if (a.hasLeftChild())
				buscar(n,a.getLeftChild());
			if (a.hasRightChild())	
				buscar(n,a.getRightChild());
		}
		if (a.getData() == n) {
			/*si encontre al numero en una raiz*/
			
			/*int cantHI = 0;
			int cantD  = 0;
			cantHI +=
			cantD +=*/ 
			int cantHI = 0;
			int cantD  = 0;
			if (a.hasLeftChild())
				cantHI = verificarHijos(a.getLeftChild());
			if (a.hasRightChild())
				cantD = verificarHijos(a.getRightChild());
			return (cantHI > cantD);
		}
		return false;
		
	}
	
	public int verificarHijos(BinaryTree<Integer> a) {
		int hijos = 0;
		if ((a.hasLeftChild() && !a.hasRightChild())) {
			hijos++;
			return verificarHijos(a.getLeftChild()) + hijos;
		}
		if (!a.hasLeftChild() && a.hasRightChild()) {
			hijos++;
			return verificarHijos(a.getRightChild()) + hijos;
		}
		if (a.hasLeftChild() && a.hasRightChild()) {
			return 0;
		}
		if (!a.hasLeftChild() && !a.hasRightChild());
			return -1;
	}
}
