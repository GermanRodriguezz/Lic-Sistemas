package Parciales;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class Parcial2Julio2022 {
	
	private boolean recorrer(Graph<String> ciudades, boolean [] marca, Vertex<String> origen, Vertex<String> destino, List<String> camino,List<String> actual, int max, int act ) {
		boolean ok = false;
		marca[origen.getPosition()] = true;
		actual.add(origen.getData());
		
		if (origen.equals(destino)) {
			camino.clear();
			camino.addAll(actual);
			return true;
		}
		else {
			
			List<Edge<String>> adyacentes = ciudades.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator(); 
			
			while (it.hasNext() && !ok) {
				Edge<String> arista = it.next();
				Vertex<String> prox = arista.getTarget();
				if (!marca[prox.getPosition()] && (act + arista.getWeight()) <= max && !ok) {
					ok = recorrer(ciudades,marca,prox,destino,camino,actual,max,act+arista.getWeight());
				}
				
			}
			if (!ok) {
				marca[origen.getPosition()] = false;
				actual.remove(actual.size()-1);
			}
		}
		return ok;
	}
	
	public List<String> caminoConPresupuesto(Graph<String> ciudades, String origen, String destino, int montoMaximo){
		List<String> camino = new LinkedList<String>();
		
		if (ciudades != null & !ciudades.isEmpty()) {
			boolean [] marca = new boolean [ciudades.getSize()];
			
			Vertex<String> or = ciudades.search(origen);
			Vertex<String> des = ciudades.search(destino);
			
			if (or != null && des != null) {
				recorrer(ciudades,marca,or,des,camino,new LinkedList<String>(),montoMaximo,0);
				
			}
			
			
		}
		return camino;
	}
	
}
