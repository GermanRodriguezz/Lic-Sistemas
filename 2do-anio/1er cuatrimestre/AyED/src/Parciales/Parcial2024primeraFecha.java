package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class Parcial2024primeraFecha {
	private GeneralTree<Integer> ag;
	
	
	public List<Integer> camino (int num){
		
		List<Integer> listaCamino = new LinkedList<Integer>();
		
		if (ag != null && !ag.isEmpty()) {
			recorrer(ag,listaCamino,num);
		}
		
		return listaCamino;
	}
	
	
	private static boolean recorrer(GeneralTree<Integer> a, List<Integer> lista, int n) {
		
		lista.add(a.getData());
		
		if (a.hasChildren()) {
			if (a.getChildren().size() >= n) {
				
				List<GeneralTree<Integer>> children = a.getChildren();
				
				for (GeneralTree<Integer> child : children) {
					if (recorrer(child, lista, n)) {
						return true;
					}
				}
			}
			/*no tiene la cantidad necesaria*/
			lista.remove(lista.size()-1);
			return false;
		}
		/*si no tiene hijos, es una hoja*/
		return true;
	}
	
}
