package tp3.ejercicio7;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class Caminos {
	private GeneralTree<Integer> a;
	
	public List<Integer> caminoAHojaMasLejana(){
		List<Integer> listaLejana = new ArrayList<Integer>();
		if (a != null && !a.isEmpty()) {
			return camino(a,listaLejana,new LinkedList<Integer>());
		}
		return listaLejana;
	}
	
	private List<Integer> camino(GeneralTree<Integer> a, List<Integer> ll, List<Integer> la){
		
		la.add(a.getData());
		
		if (a.isLeaf()) { /*no tiene hijos, llegue a una hoja, comparo los nodos de las listas*/
			if (la.size() > ll.size()){
				ll.clear();
				ll.addAll(la);
			}
		}
		else {
			for (GeneralTree<Integer> hijo : a.getChildren()) {
				camino(hijo,ll,la);
			}
			
		}
		la.remove(la.size()-1);
		return ll;
	}
	
}
