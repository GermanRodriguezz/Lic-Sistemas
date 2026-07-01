package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialSumaNodos {
	private GeneralTree<Integer> arbol;

	
	private int calcular(GeneralTree<Integer> a, List<Integer> l1, List<Integer> l2) {
		
		int total = 0;
			
		List<GeneralTree<Integer>> children = a.getChildren();
			
		for (GeneralTree<Integer> child : children) {
			total += calcular(child,l1,l2);
		}
		total += a.getData();
		
		if (a.getData() > 0) {
			l1.add(a.getData());
		}
		else {
			l2.add(a.getData());
		}
		return total;
	}
	
	private int sumarResultado(List<Integer> lista) {
		int n  = 0;
		
		for (int num : lista) {
			n += num;
		}
		
		return n;
		
	}
	
	public Integer sumar(GeneralTree<Integer> arbol) {
		int total = 0;
		List<Integer> elementosPositivos = new LinkedList<Integer>();
		List<Integer> elementosNegativos = new LinkedList<Integer>();
		if (!arbol.isEmpty()) {
			total = calcular(arbol,elementosPositivos,elementosNegativos);
		}
		if(total % 2  == 0) {
			return sumarResultado(elementosPositivos);
		}
		else
			return sumarResultado(elementosNegativos);
	}
	
}
