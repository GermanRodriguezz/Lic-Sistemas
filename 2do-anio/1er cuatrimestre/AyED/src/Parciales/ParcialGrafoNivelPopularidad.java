package Parciales;

import java.util.List;

import tp1.ejercicio8.Queue;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialGrafoNivelPopularidad {
	private Graph<String> grafo;
	
	private class Resultado {
		private boolean pop;
		private int cant;
		
		public Resultado(boolean o, int c) {
			this.pop = o;
			this.cant = c;
		}
	}
	
	private Resultado resolver(Graph<String> red, Vertex<String> origen, int distancia, int umbral, boolean [] marca) {
		boolean corte = false;
		boolean encontreNivel = false;
		int nivel = 0;
		int cantidadHijos = 0;
		marca[origen.getPosition()] = true;
		Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
		
		cola.enqueue(origen);
		cola.enqueue(null);
		
		while (!cola.isEmpty() && !corte) {
			
			Vertex<String> aux = cola.dequeue();
			
			if (aux != null) {
				
				if (distancia == nivel) {
					cantidadHijos++;
				}
				
				if (nivel < distancia) {
					List<Edge<String>> adyacentes = red.getEdges(aux);
					
					for (Edge<String> arista : adyacentes) {
						if (!marca[arista.getTarget().getPosition()]) {
							marca[arista.getTarget().getPosition()] = true;
							cola.enqueue(arista.getTarget());
						}
					}
				}
			}
			else {
				if (!cola.isEmpty()) {
					nivel++;
					if (nivel > distancia) {
						encontreNivel = true;
					}
					else {
						cola.enqueue(null);
					}
				}
			}
		}
		boolean pop = cantidadHijos >= umbral;
		return new Resultado(pop,cantidadHijos);
	}
	
	public Resultado nivelPopularidad(Graph<String> grafo, String usuario, int distancia, int umbral) {
		
		if (grafo != null || !grafo.isEmpty()) {
			
			Vertex<String> origen = grafo.search(usuario);
			if (origen != null) {
				boolean [] marca = new boolean [grafo.getSize()];
				return resolver(grafo, origen,distancia,umbral,marca);
			}
		}
		return null;
		}
	}
