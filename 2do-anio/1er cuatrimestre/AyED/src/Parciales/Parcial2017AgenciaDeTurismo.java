package Parciales;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class Parcial2017AgenciaDeTurismo {
	private Graph<String> grafo;
	
	public Parcial2017AgenciaDeTurismo(Graph<String> g) {
		this.grafo = g;
	}
	
	
	private boolean dfs(boolean [] marca, List<String> camino, int distancia, Vertex<String> origen, Vertex<String> destino, Graph<String> grafo) {
		boolean encontre = false;
		
		marca[origen.getPosition()] = true;
		
		camino.add(origen.getData());
		
		if (origen.getData().equals(destino.getData())) {
			return true;
		}
		else {
			
			List<Edge<String>> adyacentes = grafo.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator();
			
			while (it.hasNext() && !encontre) {
				
				Edge<String> arista = it.next();
				Vertex<String> ver = arista.getTarget();
				
				if (!marca[ver.getPosition()] && arista.getWeight() < distancia) {
					
					encontre  = dfs(marca,camino,distancia,ver,destino,grafo);
					
				}
			}
			if (!encontre) {
				camino.remove(camino.size()-1);
			}
			
			marca[origen.getPosition()] = false;
			
		}
		return encontre;
		
		
		
	}
	
	public List<String> caminoDistanciaMaxima (Graph<String> ciudades, String origen, String destino, int distanciaMax){
		
		Vertex<String> or = ciudades.search(origen);
		Vertex<String> des = ciudades.search(destino);
		List<String> listaResultante = new LinkedList<String>();
		if (or != null && des != null) {
			boolean [] marca = new boolean [ciudades.getSize()+1];
			
			dfs(marca, listaResultante, distanciaMax, or, des, ciudades);
			
		}
		
		return listaResultante;
		
		
	}
	
}
