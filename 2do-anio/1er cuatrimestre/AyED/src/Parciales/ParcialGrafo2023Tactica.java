package Parciales;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialGrafo2023Tactica {
	private Graph<String> grafo;
	
	private boolean recorrer(Vertex<String> origen, Vertex<String> destino, List<String> camino, List<String> caminoAct, Graph<String> jugadores,boolean [] marca,int potencia,int total) {
		boolean encontre = false;
		marca[origen.getPosition()] = true;
		
		camino.add(origen.getData());
		
		if (origen.getData().equals(destino.getData())) {
			double prom = total % camino.size();
			if (prom >= potencia) {
				camino.clear();
				camino.addAll(new LinkedList<String>(caminoAct));
				return true;
			}
		}
		else {
			
			List<Edge<String>> adyacentes = jugadores.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator();
			
			while (it.hasNext() && !encontre) {
					if (!marca[it.next().getTarget().getPosition()] && !encontre) {
						
						marca[it.next().getTarget().getPosition()] = true;
						
						encontre = recorrer(it.next().getTarget(),destino,camino,caminoAct,jugadores,marca,potencia,total + arista.getWeight());
						
					}
				
			}

			
		}
		
		
	}
	
	public List<String> tactica (Graph<String> jugadores, String arquero, String delantero, double potencia){
		
		Vertex<String> origen = jugadores.search(arquero);
		Vertex<String> destino = jugadores.search(delantero);
		List<String> camino = new LinkedList<String>();
		if (origen != null && destino != null) {
			
			boolean marca [] = new boolean [jugadores.getSize()];
			recorrer(origen,destino,camino,new LinkedList<String>(),jugadores,marca,potencia,0);
			
		}
		return camino;
	}
}
