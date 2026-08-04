package Parciales;

import java.util.List;

import tp1.ejercicio8.Queue;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialNivelPopularidadGrafo {
	
	private class Resultado {
		private int cantidadUsuarios;
		private boolean esPopular;
		
		public Resultado(int cant, boolean es) {
			this.cantidadUsuarios = cant;
			this.esPopular = es;
		}
	}
	
	private Resultado bfs(Graph<String> red, boolean [] marca, Vertex<String> origen, int distancia, int umbral) {
		Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
		int nivel = 0;
		int cant = 0;
		boolean limite = false;
		marca[origen.getPosition()] = true;
		
		cola.enqueue(origen);
		cola.enqueue(null);
		
		while (!cola.isEmpty() && !limite) {
			
			Vertex<String> aux = cola.dequeue();
			
			if (aux != null) {
				/*caso base - que haya llegado al nivel*/
				if (nivel == distancia) {
					cant++;
				}/*si no estoy en el nivel - encola los hijos*/
				if (nivel < distancia) {
					List<Edge<String>> adyacentes = red.getEdges(origen);
					
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
					/*si estaba en el nivel - limite = a true para cortar al volver al while*/
					if (nivel > distancia) {
						limite = true;
					}
					else {/*el siguiente nivel no se pasa de la distancia, arriba verifico llegar a la distancia*/
						cola.enqueue(null);
					}
				}
			}
			/*si saque un null*/
		}
		boolean es = cant >= umbral;
		return new Resultado(cant,es);
	}
	
	public Resultado nivelPopularidad(Graph<String> red, String usuario, int distancia,int umbral) {
		
		if (red != null && !red.isEmpty()) {
			
			Vertex<String> origen = red.search(usuario);
			
			if (origen != null) {
				boolean [] marca = new boolean [red.getSize()];
				
				return bfs(red,marca,origen,distancia,umbral);
				
			}	
		}
		return null;
	}
	
}
