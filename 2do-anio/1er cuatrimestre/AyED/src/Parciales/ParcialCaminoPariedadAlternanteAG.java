package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialCaminoPariedadAlternanteAG {
	
	public static List<Integer> caminoParidadAlternante(GeneralTree<Integer> arbol){
		List<Integer> caminoResultante = new LinkedList<Integer>();
		
		if(arbol != null && !arbol.isEmpty()) {
			
			recorrer(arbol,caminoResultante,new LinkedList<Integer>());
			
		}
		
		return caminoResultante;
	}
	
	private static void recorrer(GeneralTree<Integer> arbol, List<Integer> camino, List<Integer> caminoActual) {
		caminoActual.add(arbol.getData());
		if (arbol.isLeaf()) {
			if (caminoActual.size() > camino.size()) {
				
				camino.clear();
				camino.addAll(caminoActual);
				
			}
		}
		List<GeneralTree<Integer>> children = arbol.getChildren();
		
		boolean paridadPadre = arbol.getData() % 2 == 0;
		
		for (GeneralTree<Integer> child : children) {
			boolean paridadHijo = child.getData() % 2 == 0;
			if (paridadPadre != paridadHijo) {		// voy a recorrer solo por los que tienen la alternancia
				recorrer(child,camino,caminoActual);
			}
		}
		caminoActual.remove(caminoActual.size()-1);
	}
	
}
