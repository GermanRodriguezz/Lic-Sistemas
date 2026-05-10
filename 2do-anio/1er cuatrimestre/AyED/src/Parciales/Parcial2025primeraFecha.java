package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class Parcial2025primeraFecha {
	
	public static List<Integer> primerCaminoAlternanteCeroNoCero(GeneralTree<Integer> a ){
		List<Integer> caminoAct = new LinkedList<Integer>();
		
		if (!a.isEmpty()) {
			 buscar(a,caminoAct);
			 return caminoAct;
		}
		
		return caminoAct;
	}
	
	
	private static boolean buscar(GeneralTree<Integer> a, List<Integer> lista) {
		
		lista.add(a.getData());
		
		if (a.isLeaf()) {
			return true;
		}
		
		int padre = a.getData(); /*tomo el nodo actual -> padre*/
		
		for (GeneralTree<Integer> child : a.getChildren()) {
			
			if (verificar(padre, child.getData())) {
				if(buscar(child,lista)) /*si devolvio true corto la recursion*/
					return true;
			}
		}
		lista.remove(lista.size()-1);
		return false;
		
	}
	
	private static boolean verificar(int padre , int hijo) {
		return (padre % 10 == 0 && hijo % 10 != 0) || (padre % 10 != 0  && hijo % 10 == 0); 
	}
	
}
