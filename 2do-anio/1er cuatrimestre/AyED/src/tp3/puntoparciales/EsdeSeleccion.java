package tp3.puntoparciales;

import java.util.Iterator;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class EsdeSeleccion {
	
	private static boolean recorrido(GeneralTree<Integer> a) {
		boolean corte = false;
		int minimo = Integer.MAX_VALUE;
		
		if (a.isLeaf()) {
			return true;
		}
		
		List<GeneralTree<Integer>> children = a.getChildren();
		
		for (GeneralTree<Integer> child : children) {
			
			if (child.getData() < minimo) {
				minimo = child.getData();
			}
		}
		
		boolean puede =  (a.getData() == minimo);
		
		Iterator<GeneralTree<Integer>> it = children.iterator();
		
		while (it.hasNext() && puede) {
			puede = recorrido(it.next());
		}	
		return corte;
		
	}
	
	public static boolean esDeSeleccion(GeneralTree<Integer> arbol) {
		
		return recorrido(arbol);
		
	}
}
