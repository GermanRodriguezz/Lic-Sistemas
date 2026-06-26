package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp2.ejercicio1.BinaryTree;

public class Parcial1raFecha2022 {
	
	public List<Integer> resolver(BinaryTree<Integer> arbol, int min){
		List<Integer> resultante = new LinkedList<Integer>();
		
		if (!arbol.isEmpty()) {
			
			if(recorrido(arbol,min,resultante,0))
				return resultante;
		}
		return resultante;
	}

	
	private boolean recorrido(BinaryTree<Integer> a,int minimo, List<Integer> lista, int cantPares) {
		boolean encontre = false;
		lista.add(a.getData());
		
		if (a.getData() % 2 == 0) {
			cantPares += 1;
		}
		
		if (a.isLeaf()) {
			return cantPares >= minimo;
		}
		else {
			if (a.hasLeftChild()&& !encontre) {
				encontre = recorrido(a.getLeftChild(),minimo,lista,cantPares);
			}
			if (a.hasRightChild()&&!encontre) {
				encontre = recorrido(a.getRightChild(),minimo,lista,cantPares);
			}
		}
		if (!encontre) {
			lista.remove(lista.size()-1);
		}
		return encontre;
	}
	
}
