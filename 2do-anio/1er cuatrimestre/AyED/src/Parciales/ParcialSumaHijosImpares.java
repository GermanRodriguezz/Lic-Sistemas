package Parciales;
/*
 * Implemente en la clase Parcial que tiene como variable de instancia un ArbolGeneral<Integer>, el
método ListaGenerica<Integer> resolver() que devuelva en la lista la suma de todos los datos
contenidos en los nodos del árbol que tiene un número impar de hijos. Realiza un recorrido en
postorden

 * */

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialSumaHijosImpares {
	private GeneralTree<Integer> a;
	
	
	private void generarLista(GeneralTree<Integer> a, List<Integer> lista) {
		
		List<GeneralTree<Integer>> children = a.getChildren();
		
		for (GeneralTree<Integer> child : children) {
			generarLista(child, lista);
		}
		if (children.size() % 2 != 0) {
			int suma = 0;
			
			for (GeneralTree<Integer> child : children) {
				suma += child.getData();
			}
			
			lista.add(suma);
		}
		
	}
	
	public List<Integer> resolver (){
		List<Integer> lista = new LinkedList<Integer>();
		
		if (!this.a.isEmpty()) {
			generarLista(a,lista);
		}
		return lista;
	}
	
}
