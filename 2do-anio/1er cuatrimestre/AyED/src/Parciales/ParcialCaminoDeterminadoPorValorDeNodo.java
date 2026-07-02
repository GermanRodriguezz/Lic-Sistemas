package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialCaminoDeterminadoPorValorDeNodo {
	private GeneralTree<Integer> arbol;
	
	
	private void devolverCamino(GeneralTree<Integer> a, List<Integer> camino) {
		
		camino.add(a.getData());
		
		if (!a.isLeaf()) {
			
			List<GeneralTree<Integer>> children = a.getChildren();
			
			if (a.getData() < children.size()) {
				
				devolverCamino(children.get(a.getData()), camino);
			}
			
		}
		
	}
	
	public List<Integer> resolver(GeneralTree<Integer> a){
		
		List<Integer> camino = new LinkedList<Integer>();
		
		if (!a.isEmpty()) {
			
			devolverCamino(a,camino);
		}
		
		return camino;
		
	}
}
