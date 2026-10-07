package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialAGPrimeraFecha2024 {
	private GeneralTree<Integer> arbol;
	
	public List<Integer> camino (int num){
		List<Integer> resultado = new LinkedList<Integer>();
		
		if (arbol == null || arbol.isEmpty()) {
			return resultado;
		}
		
		recorrer(resultado,num,arbol);
		return resultado;
	}
	
	private boolean recorrer(List<Integer> lista, int num,GeneralTree<Integer> a) {
		lista.add(a.getData());
		if (a.isLeaf()) {
			return true;
		}
		
		List<GeneralTree<Integer>> children = a.getChildren();
		
		if (children.size() >= num) { // si la cantidad de hijos del actual cumple
			for (GeneralTree<Integer> child : children) { //aplico el recorrido por la lista de los hijos
				if (recorrer(lista,num,child))
					return true;
			}
		}
		lista.remove(lista.size()-1);
		return false;
	}
}
