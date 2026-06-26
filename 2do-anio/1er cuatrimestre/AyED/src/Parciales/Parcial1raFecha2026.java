package Parciales;

import tp2.ejercicio1.BinaryTree;

public class Parcial1raFecha2026 {
	private BinaryTree<Integer> grafo;
	
	
	public int resolver(BinaryTree<Integer> a) {
	    if (a == null || a.isEmpty())
	        return 0;

	    return recorrer(a);
	}

	private int recorrer(BinaryTree<Integer> a) {

	    int total = 0;

	    if (a.isLeaf()) {
	        if (a.getData() % 2 == 0)
	            total += a.getData();
	    
	    }
	    else {

	        if (a.hasLeftChild() && a.hasRightChild() && a.getData() % 2 != 0)
	        	total -= a.getData();
	        total += recorrer(a.getLeftChild());
	        total += recorrer(a.getRightChild());
	 
	    }

	    return total;
	}
}
