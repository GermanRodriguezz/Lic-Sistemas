package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialCaminoSignoAlternanteAB2025 {
	public static List<Integer> caminoSignoAlternante(GeneralTree<Integer> arbol){
		List<Integer> caminoResultado = new LinkedList<Integer>();
		
		if (arbol != null && !arbol.isEmpty()) {
			
			recorrer(arbol,caminoResultado,new LinkedList<Integer>(),0,Integer.MIN_VALUE);
			
		}
		
		return caminoResultado;
		
	}
	
	private static int recorrer(GeneralTree<Integer> a, List<Integer> camino,List<Integer> caminoAct,int costoAct,int costoMax) {
		caminoAct.add(a.getData());
		costoAct+= a.getData();
		
		if (a.isLeaf()) {		//llego a una hoja - osea un posible camino valido
			
			if (costoAct > costoMax) {
				camino.clear();
				camino.addAll(caminoAct);
				costoMax = costoAct;
			}
		}
		else {
		//si no es una hoja
		List<GeneralTree<Integer>> children = a.getChildren();
		boolean padrePos = a.getData() >= 0; //tomo como referencia signo del padre actual
		for (GeneralTree<Integer> child : children) {
			boolean hijoPos = child.getData() >= 0; //signo del hijo - cada hijo
			if (padrePos != hijoPos) {				//solo ira por el hijo que cumple la alternancia
				costoMax = recorrer(child,camino,caminoAct,costoAct,costoMax);	// me guardo el costoMax de cada recorrido
			}
		}
		}
		caminoAct.remove(caminoAct.size()-1);
		return costoMax;
	}
}
