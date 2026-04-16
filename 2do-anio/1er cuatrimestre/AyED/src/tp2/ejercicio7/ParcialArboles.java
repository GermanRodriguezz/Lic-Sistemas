package tp2.ejercicio7;

import tp2.ejercicio1.BinaryTree;
import tp2.ejercicio6.Transformacion;

public class ParcialArboles {
	private BinaryTree<Integer> ar;
	
	public ParcialArboles(BinaryTree<Integer> a) {
		this.ar = a;
	}
	
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
			/*si encontre al numero en una raiz*/;
			int cantHI = 0;	
			int cantD  = 0;
			if (a.hasLeftChild())
				cantHI = verificarHijos(a.getLeftChild());
				
			else {
				cantHI = -1;
				System.out.println("no tiene subArbol izq");
			}
			if (a.hasRightChild())
				cantD = verificarHijos(a.getRightChild());
			else {
				cantD = -1;
				System.out.println("no tiene subArbol der");
			}
			System.out.println( "HI :" + cantHI + "HD :" + cantD);
			if (cantHI > cantD)
				System.out.println("ES MAS GRANDE : " + cantHI);
			else {
				System.out.println("ES MAS GRANDE : " + cantD);
			}
			return (cantHI > cantD);
		}
		return false;
		
	}
	
	public int verificarHijos(BinaryTree<Integer> a) {
		int hijos = 0;
		if (a.hasLeftChild()) {
			if (!a.hasRightChild()) {
				hijos++;
				System.out.println("Sumo uno en el hijo izq");
			}
			verificarHijos(a.getLeftChild());
		}
		if (a.hasRightChild()) {
			if (!a.hasLeftChild()) {
				hijos++;
				System.out.println("Sumo uno en el hijo der");
			}
			verificarHijos(a.getRightChild());
		}
		return hijos;
	}
    public static void main (String[] args) {
        System.out.println("");
        BinaryTree<Integer> ar = new BinaryTree<Integer>(4);
        ar.addLeftChild(new BinaryTree<Integer>(2));
        ar.addRightChild(new BinaryTree<Integer>(6));
        ar.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
        ar.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        ar.getRightChild().addRightChild(new BinaryTree<Integer>(8));
        
        System.out.println("");
        
        ParcialArboles impresor = new ParcialArboles(ar);
        if (impresor.buscar(5, ar)) {
        	System.out.println("Retorno veradero");
        }
        else {
        	System.out.println("Retorno falso");
        }
    }
	
}
