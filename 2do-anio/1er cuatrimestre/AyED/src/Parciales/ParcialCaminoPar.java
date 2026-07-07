/*
 * 
 * 
 * 
 * Dado un árbol general, encontrar todos los caminos desde la raíz a una hoja, tales que la cantidad de
nodos en el camino sea un número par. Escribir el siguiente método dentro de la clase Parcial public ??
caminosPares(ArbolGeneral<Character> arbol)
 * 
 * */


package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;


public class ParcialCaminoPar {
	private GeneralTree<Character> arbol;
	
	
	public ParcialCaminoPar(GeneralTree<Character> a) {
		this.arbol = a;
	}
	
	private void buscarCaminos(GeneralTree<Character> a, List<List<Character>> caminos, List<Character> camino, int cantNodos) {
		
		camino.add(a.getData()); /*agrego el nodo a la lista*/
		if (a.isLeaf()) {		/*si estoy en una hoja*/
			if (cantNodos % 2 == 0) {	/*si la cantidad de nodos que llevo es par entonces debo agregar el camino a la lista*/
				caminos.add(new LinkedList<Character>(camino));
			}
		}
		else {
			List<GeneralTree<Character>> children = a.getChildren();
			for (GeneralTree<Character> child : children) {
				buscarCaminos(child, caminos, camino, cantNodos + 1);
			}
		}
		camino.remove(camino.size()-1); /*es una hoja pero no cumple, elimino siempre*/
	}
	
	public List<List<Character>> caminosPares (GeneralTree<Character> a){
		List<List<Character>> caminos = new LinkedList<List<Character>>();
		
		if (!a.isEmpty()) {
			buscarCaminos(a,caminos,new LinkedList<Character>(),1);
		}
		
		return caminos;
	}
	
	
}
