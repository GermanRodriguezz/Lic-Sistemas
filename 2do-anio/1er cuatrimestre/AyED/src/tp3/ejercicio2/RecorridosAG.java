package tp3.ejercicio2;

import java.util.*;

import tp1.ejercicio8.Queue;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class RecorridosAG {
	/*
	 * 
	 * RECORRIDO PRE ORDEN
	 * 
	 * */
	public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree<Integer> a, Integer n){
		List<Integer> lista = new LinkedList<Integer>();
		if (a.getData() != null && !a.isEmpty()) {
			recorrerPRE(a,lista,n);
		}
		return lista;
	}
	
	

	private void recorrerPRE(GeneralTree<Integer> a, List<Integer> l, Integer num){
		if (a.getData() % 2 == 1) {
			if (a.getData() > num) {
				l.add(a.getData());
			}
		}
		if (a.hasChildren()) {
			List<GeneralTree<Integer>> hijos = a.getChildren();
			for (GeneralTree<Integer> hijo : hijos) recorrerPRE(hijo,l,num);
		}
	}
	
	
	/*
	 * 
	 * RECORRIDO IN ORDEN
	 * 
	 * */
	public List<Integer> numerosImparesMayoresQueInOrden(GeneralTree<Integer> a, Integer n){
		List<Integer> lista = new LinkedList<Integer>();
		if (!a.isEmpty()) {
			recorrerIN(a,lista,n);
		}
		return lista;
	}
		
	private static void recorrerIN(GeneralTree<Integer> a, List<Integer> l, Integer n){
		List<GeneralTree<Integer>> children = a.getChildren();
		if (a.hasChildren()) {
			Iterator<GeneralTree<Integer>> it = children.iterator();
			if (it.hasNext())
				recorrerIN(it.next(),l,n);
		
			if (a.getData() % 2 == 1) {
				if (a.getData() > n)
					l.add(a.getData());
			while (it.hasNext()) {
				recorrerIN(it.next(),l,n);
				}
			}
		}
		else {
			if (a.getData() % 2 == 1) {
				if (a.getData() > n)
					l.add(a.getData());
			}
		}
	}
	
	/*
	 * 
	 * RECORRIDO POST ORDEN
	 * 
	 * 
	 * */
	
	public List<Integer> numerosImparesMayoresQuePost(GeneralTree<Integer> a, Integer n){
		List<Integer> lista = new LinkedList<Integer>();
		if (!a.isEmpty()) {
			recorrerPOST(a,lista,n);
		}
		return lista;
	}
	
	private static void recorrerPOST(GeneralTree<Integer> a, List<Integer> l, Integer num) {
		if (a.hasChildren()) {
			List<GeneralTree<Integer>> hijos = a.getChildren();
			for (GeneralTree<Integer> hijo : hijos) {
				recorrerPOST(hijo,l,num);
				}				
			} 
		else {	
			if (a.getData() % 2 == 1) {
				if (a.getData() > num) 
					l.add(a.getData());
			}
		}
	}
	
	
	/*
	 * 
	 * 
	 * RECORRIDO POR NIVELES
	 * 
	 * 
	 * */
	public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree<Integer> a , Integer n){
		LinkedList<Integer> lista = new LinkedList<Integer>();
		if (!a.isEmpty()) {
			recorrerNIVEL(a,lista,n);
		}
		return lista;
	}
	
	private void recorrerNIVEL(GeneralTree<Integer> a, List<Integer> l, Integer n) {
		GeneralTree<Integer> tree_aux;
		
		Queue<GeneralTree<Integer>> queue = new Queue<GeneralTree<Integer>>();
		queue.enqueue(a); /*guardamos en la cola el arbol recibido*/
		
		while (!queue.isEmpty()) {
			tree_aux = queue.dequeue(); /*aca nuestra variable auxiliar tomara el valor de el arbol que encolamos*/
			if (tree_aux.getData() % 2 == 1 && tree_aux.getData() > n) l.add(tree_aux.getData());
			List<GeneralTree<Integer>> children = tree_aux.getChildren();
			for (GeneralTree<Integer> child : children) {
				queue.enqueue(child);
			}
		}
	}
	
}

