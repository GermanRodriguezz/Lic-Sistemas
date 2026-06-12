package Parciales;

import java.util.Iterator;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class Parcial2024BioParqueTemaiken {

	private class Recinto {
		private String name;
		private int tiempo;
		
		public Recinto(String n , int t) {
			this.name = name;
			this.tiempo = t;
		}
		
		public Recinto() {
			
		}
		
		public String getName() {
			return this.name;
		}
		
		public int getTiempo() {
			return this.tiempo;
		}
		
	}
	
	private int dfs(Vertex<Recinto> origen, boolean [] marca, int tiempo, Graph<Recinto> grafo) {
		
		marca[origen.getPosition()] = true;
		
		int cantidad = 0;
		int cantMax = 0;
		
		List<Edge<Recinto>> aristas = grafo.getEdges(origen);
		
		for (Edge<Recinto> arista : aristas) {
			
			Vertex<Recinto> vertice = arista.getTarget();
			
			int tiempoActual = arista.getWeight();
			
			int tiempoDestino = vertice.getData().getTiempo();
			
			if (!marca[vertice.getPosition()] &&  (tiempoActual + tiempoDestino) <= tiempo) {
				
				cantidad = dfs(vertice, marca, tiempo - (tiempoActual + tiempoDestino), grafo);
				
				if (cantidad > cantMax) {
					
					cantMax = cantidad;
				}
			}	
		}
		marca[origen.getPosition()] = false;
		return cantMax + 1; /*mas 1 porque cuando retorne de la recursion */
		
	}
	
	public int resolver(Graph<Recinto> grafo, int tiempo) {
		int cantidadMaxVisitados = 0;
		
		/*tomo la lista de vertices para poder buscar la entrada*/
		Iterator<Vertex<Recinto>> vertices = grafo.getVertices().iterator();
		boolean encontre = false;
		
		Vertex<Recinto> ver = null;
		
		while (vertices.hasNext() && !encontre) {
			 ver = vertices.next();
			if (ver.getData().getName().equals("Entrada")) {
				encontre = true;
			}
		}
		
		
		/*el vertice donde ecnontraste la entrada*/
		boolean [] marca = new boolean[grafo.getSize()+1];
		
		if (ver != null) {
			cantidadMaxVisitados = dfs(ver,marca,tiempo - ver.getData().getTiempo(),grafo);
		}
		
		return cantidadMaxVisitados;
		
	}
	
	
	
}
