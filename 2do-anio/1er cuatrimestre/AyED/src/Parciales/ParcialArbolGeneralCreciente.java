package Parciales;

import java.util.List;

import tp1.ejercicio8.Queue;
import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialArbolGeneralCreciente {
	
	
	private GeneralTree<Integer> creciente(GeneralTree<Integer> a) {
		int cantidad = 0;
		int nivel = 0;
		int maxHijos = 0;
		int cantHijos = Integer.MIN_VALUE;
		GeneralTree<Integer> nodo = new GeneralTree<Integer>();
		boolean corte = false;
		
		Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
		
		cola.enqueue(a);
		cola.enqueue(null);
		
		while (!cola.isEmpty() && !corte) {
			
			GeneralTree<Integer> aux = cola.dequeue();
			
			if (aux != null) {
				
				/*agarro los hijos*/
				List<GeneralTree<Integer>> ady = aux.getChildren();
				
				cantHijos = ady.size();
				if (cantHijos > maxHijos) {
					maxHijos = cantHijos;
					nodo = aux;
				}
				
				for (GeneralTree<Integer> ad : ady) {
					cola.enqueue(ad);
					cantidad++;
				}
			}
			else {
				if (!cola.isEmpty()) {
					nivel++;
					cola.enqueue(null);
					
					if (cantidad != nivel+1){
						corte = true;
						nodo = null;
					}
					cantidad = 0;
				}
			}
		}
		return nodo;
	}
	
	public GeneralTree<Integer> resolver(GeneralTree<Integer> a){
		
		if (a == null || a.isEmpty()) {
			return null;
			
		}
		return creciente(a);
		
	}
	
}
