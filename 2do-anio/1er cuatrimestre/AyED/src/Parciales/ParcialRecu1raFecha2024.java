package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialRecu1raFecha2024 {
	private GeneralTree<Integer> a;
	
	
	private class Compuesto {
		private int vueltas;
		private int compuesto;
		public Compuesto() {
		}
		
		public int getVueltas() {
			return this.vueltas;
		}
		
		public int getCompuesto() {
			return this.compuesto;
		}
	}
	
	private int recorrer(GeneralTree<Compuesto> a,List<Compuesto> listaResultante, List<Compuesto> listaActual, int costoActual, int costoMinimo ) {
		
		listaActual.add(a.getData());
		costoActual += a.getData().getVueltas() * a.getData().getCompuesto();
		
		if (a.isLeaf()) {
			if (costoActual < costoMinimo) {
				costoMinimo = costoActual;
				listaResultante.clear();
				listaResultante.addAll(listaActual);
			}
		}
		else {
			List<GeneralTree<Compuesto>> children = a.getChildren();
			
			for (GeneralTree<Compuesto> child : children) {
				
				costoMinimo += recorrer(child,listaResultante,listaActual,costoActual + 10,costoMinimo);
			
			}
		}
		listaActual.remove(listaActual.size()-1);
		return costoMinimo;
	}
	public List<Compuesto> mejorEstrategia (GeneralTree<Compuesto> arbol){
		
		List<Compuesto> resultado = new LinkedList<Compuesto>();
		
		if (!arbol.isEmpty()) {
			int minimo = Integer.MAX_VALUE;
			recorrer(arbol,resultado,new LinkedList<Compuesto>(), 0, minimo);
		}
		return resultado;
		
	}
	
}
