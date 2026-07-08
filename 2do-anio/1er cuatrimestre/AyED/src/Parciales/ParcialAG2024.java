package Parciales;

import java.util.List;
import java.util.LinkedList;

import tp1.ejercicio8.Queue;
import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialAG2024 {
	private GeneralTree<Integer> ag;
	
	
	public List<Integer> nivel (int num){
		boolean cumple = true;

		List<Integer> resultado = new LinkedList<Integer>();
		
		Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
		
		cola.enqueue(ag); /*encolamos la raiz*/
		cola.enqueue(null); /*separo el nivel*/ // 10 null 8 5 null 5 22 19 null
		
		while (!cola.isEmpty()) {
			
			GeneralTree<Integer> aux = cola.dequeue();
			
			if (aux != null) {
				
				List<GeneralTree<Integer>> children = aux.getChildren();
				
				if (children.size() >= num) { /*encontre el nivel que cumple*/
					resultado.add(aux.getData());
				
				}
				else {
					cumple = false;
				}
				
				for (GeneralTree<Integer> child : children) {
					
					cola.enqueue(child);
					
				}
				
			}
			else { /*cambie el nivel */
				
				if (cumple && !resultado.isEmpty()) {
					return resultado;
				}
				resultado.clear();
				cumple = true;
				if (!cola.isEmpty())
					cola.enqueue(null);
			}
		}
		return resultado;
	}
	
}
