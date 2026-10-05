package Parciales;

import java.util.*;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class PrimeraFecha2025AG {
	
	public static List<Integer> primerCaminoAlternanciaCeroNoCero(GeneralTree<Integer> arbol){
		List<Integer> camino = new LinkedList<Integer>();
		
		//si el arbol no es nulo y tampoco esta vacio
		if (arbol != null && !arbol.isEmpty()) {
			//aca quiero quedarme con el resto : 
			
			primerCamino(arbol,camino);
			
			
		}
		return camino;
	}
	
	private static boolean primerCamino(GeneralTree<Integer> arbol, List<Integer> camino) {
		camino.add(arbol.getData());
		//si sos una hoja
		if (arbol.isLeaf()) {
			return true;
		}
		
		List<GeneralTree<Integer>> children = arbol.getChildren();
				
		for (GeneralTree<Integer> child : children) {
			
			boolean padreTerminaEnCero = (arbol.getData() % 10 == 0);
			boolean hijoTerminaEnCero = (child.getData() % 10 == 0);

			if (padreTerminaEnCero != hijoTerminaEnCero) {
				if (primerCamino(child,camino))
					return true;
			}
		}
		camino.remove(camino.size()-1);
		return false;
	}
	
}
