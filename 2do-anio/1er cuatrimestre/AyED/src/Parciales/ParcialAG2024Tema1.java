package Parciales;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialAG2024Tema1 {
	private GeneralTree<Integer> ag;
	
	
	private boolean recorrer(GeneralTree<Integer> a, List<Integer> camino,int num) {
		boolean encontre = false;
		camino.add(a.getData());
		
		if (a.isLeaf()) {
			
			camino.add(a.getData());
			return true;
			
		}
		
		List<GeneralTree<Integer>> child = a.getChildren();
		
		Iterator<GeneralTree<Integer>> it = child.iterator();
			
		while (it.hasNext() && !encontre) {
			
			if (child.size() >= num) {
				
				encontre = recorrer(it.next(),camino,num);
			}
			
		}
		if (!encontre) {
			camino.remove(camino.size()-1);
		}
		return encontre;
		
	}
	
	public List<Integer> camino(int num){
		
		List<Integer> camino = new LinkedList<Integer>();
		
		if (ag != null && !ag.isEmpty()) {
			
			recorrer(ag,camino,num);
			
		}
		
		return camino;
		
	}
}
