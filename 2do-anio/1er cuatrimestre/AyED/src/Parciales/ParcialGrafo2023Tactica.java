package Parciales;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialGrafo2023Tactica {
	private Graph<String> grafo;
	
	private boolean recorrer(Vertex<String> origen, Vertex<String> destino, List<String> camino, Graph<String> jugadores,boolean [] marca,double potencia,int total) {
		boolean encontre = false;
		marca[origen.getPosition()] = true;
		
		camino.add(origen.getData());
		
		if (origen.equals(destino)) {
			double prom = total / camino.size();
			if (prom >= potencia) {
				return  true;
			}
		}
		else {
			
			List<Edge<String>> adyacentes = jugadores.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator();
			
			while (it.hasNext() && !encontre) {
				Edge<String> arista = it.next();
				Vertex<String> ver = arista.getTarget();
				if (!marca[ver.getPosition()] && !encontre) {
				
					encontre = recorrer(ver,destino,camino,jugadores,marca,potencia,total + arista.getWeight());
						
				}	
			}
			if (!encontre) {
				camino.remove(camino.size()-1);
			}
		}
		marca[origen.getPosition()] = false;
		return encontre;
	}
	
	public List<String> tactica (Graph<String> jugadores, String arquero, String delantero, double potencia){
		
		Vertex<String> origen = jugadores.search(arquero);
		Vertex<String> destino = jugadores.search(delantero);
		List<String> camino = new LinkedList<String>();
		if (origen != null && destino != null) {
			
			boolean marca [] = new boolean [jugadores.getSize()];
			recorrer(origen,destino,camino,jugadores,marca,potencia,0);
			
		}
		return camino;
	}
}
