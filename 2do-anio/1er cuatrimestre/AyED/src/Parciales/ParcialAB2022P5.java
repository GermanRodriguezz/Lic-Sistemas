package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialAB2022P5 {
	
	
	private void BuscarCaminos(GeneralTree<Character> arbol, List<List<Character>> caminos, List<Character> caminoAct) {
		caminoAct.add(arbol.getData());
		
		if (arbol.isLeaf()) {
			if (caminoAct.size() % 2 == 0) {
				caminos.add(new LinkedList<Character>(caminoAct));
			}
		}
		
		List<GeneralTree<Character>> children = arbol.getChildren();
		for (GeneralTree<Character> child : children) {
			
			BuscarCaminos(child, caminos, caminoAct);
			
		}
		caminoAct.remove(caminoAct.size()-1);
	}
	
	public List<List<Character>> resolver(GeneralTree<Character> a){
		
		List<List<Character>> caminos = new LinkedList<List<Character>>();
		
		if (a != null || !a.isEmpty()) {
			
			BuscarCaminos(a,caminos,new LinkedList<Character>());
		}
		return caminos;
		
	}
	
}
