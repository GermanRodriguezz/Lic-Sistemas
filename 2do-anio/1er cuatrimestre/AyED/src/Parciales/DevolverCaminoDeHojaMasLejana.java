package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

/*
 * Devolver el camino a la hoja mas lejana. Si hubiese más de
un camino de igual longitud, devolver el primero encontrado
 * 
 * */

public class DevolverCaminoDeHojaMasLejana {
	private GeneralTree<Integer> arbol;
	
	
	private void recorrer(GeneralTree<Integer> a, List<Integer> camino, List<Integer> caminoActal) {
		caminoActal.add(a.getData());
		
		if (a.isLeaf()) {
			int cantnodos = caminoActal.size();
			int cant = camino.size();
			if (cantnodos > cant) {
				camino.clear();
				camino.addAll(new LinkedList<Integer>(caminoActal));
			}
		}
		else {
			List<GeneralTree<Integer>> children = a.getChildren();
			
			for (GeneralTree<Integer> child : children) {
				recorrer(child,camino,caminoActal);
			}
		}
		
		caminoActal.remove(caminoActal.size()-1);
		
	}
	
	public List<Integer> encontrarCamino(GeneralTree<Integer> a){
		List<Integer> camino = new LinkedList<Integer>();
		
		if (!a.isEmpty()) {
			recorrer(a,camino,new LinkedList<Integer>());
		}
		return camino;
	}
}
