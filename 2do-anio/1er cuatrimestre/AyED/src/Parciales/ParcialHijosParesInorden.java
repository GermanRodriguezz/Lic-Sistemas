package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialHijosParesInorden {
	
	private void recorrer(GeneralTree<Integer> ag, List<GeneralTree<Integer>> lista) {
		
		if (!ag.isLeaf()) {
			/*tenes hijos*/
			List<GeneralTree<Integer>> children = ag.getChildren();
			
			recorrer(children.get(0),lista);
			
			if (children.size() % 2 == 0) {
				lista.add(ag);
			}
			
			for (int i= 1; i < children.size(); i++) {
				recorrer(children.get(i),lista);
			}
			
		}
		
	}
	
	public List<GeneralTree<Integer>> resolver(GeneralTree<Integer> arbol){
		
		List<GeneralTree<Integer>> lista = new LinkedList<GeneralTree<Integer>>();
		
		if (arbol != null && !arbol.isEmpty()) {
			
			recorrer(arbol,lista);
			
		}
		
		return lista;
		
	}
	
}
