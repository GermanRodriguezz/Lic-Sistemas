package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialCantidadNodos {
	private GeneralTree<Integer> arbol;
	
	
	private Integer calcular(GeneralTree<Integer> a,List<Integer> pos, List<Integer> neg) {
		
		int cantidad= 0;
		
		List<GeneralTree<Integer>> children = a.getChildren(); 
		
		if (!children.isEmpty()) {
			cantidad += calcular(children.get(0),pos,neg);
		}
		
		if(a.getData() > 0) {
			pos.add(a.getData());
		}
		else {
			neg.add(a.getData());
		}
		
		for (int i = 1; i < children.size(); i++) {
			cantidad += calcular(children.get(i),pos,neg);
		}
		
		return cantidad + 1;
		
	}
	
	public Integer resolver(GeneralTree<Integer> a) {
		
		List<Integer> positivos = new LinkedList<Integer>();
		List<Integer> negativos = new LinkedList<Integer>();
		int cantidad = 0;
		if(!a.isEmpty()) {
			cantidad = calcular(a,positivos,negativos);
		}
		if (cantidad % 2 == 0) {
			return positivos.size();
		}
		else {
			return negativos.size();
		}
	}
}
