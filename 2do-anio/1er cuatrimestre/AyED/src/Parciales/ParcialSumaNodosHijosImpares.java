package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialSumaNodosHijosImpares {
	private GeneralTree<Integer> arbol;
	
	public List<Integer> resolver(){
		List<Integer> lista = new LinkedList<Integer>();
		
		if (this.arbol != null && !this.arbol.isEmpty()) {
			
			recorrer(arbol,lista);
			
		}
		
		return lista;
	}
	
	private void recorrer(GeneralTree<Integer> ag, List<Integer> lista) {
		
		List<GeneralTree<Integer>> children = ag.getChildren();
		int suma = 0; 		// por hijo creo variable acumuladora
		for (GeneralTree<Integer> child : children) {
			recorrer(child,lista);		//recorro con el hijo
			suma += child.getData();	//cuando vuelve sumo el valor
		}
		
		if (children.size() % 2 != 0) {// cuando termino el recorrido por todos los hijos pregunto si tiene los hijos impares
			lista.add(suma);			//agrego el resultado de la suma de sus hijos
		}
		
	}
	
}
