package tp5.grafos.src.tp5.ejercicio2;

import java.util.*;


import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp1.ejercicio8.Queue;

public class Recorridos<T> {
	
	private List<T> recorrerDFS (Graph<T> grafo,List<T> lista, boolean [] vector,Integer i){
		vector[i] = true;		/*marco como visitado el vertice*/
		Vertex<T> ver = grafo.getVertex(i);	/*tomo el vertice del grafo de la posicion que recibo*/
		lista.add(ver.getData());		/*agrego a la lista*/
		
		List<Edge<T>> adyacentes = grafo.getEdges(ver);	/*declaro la lista de tipo arista - de las aristas del vertice tomado*/
		for (Edge<T> arista : adyacentes) {
			int pos = arista.getTarget().getPosition();	
			/*desde la posicion destino osea getTarget , tomo la posicion de esa arista*/
			if (vector[pos] != false) { /*si esa posicion no fue visitada, recorro el dfs desde alli*/
				recorrerDFS(grafo,lista,vector,pos);
			}
		}
		return lista;
		
	}
	/*0 V + E*/
	public List<T> dfs(Graph<T> grafo){
		
		boolean [] vector = new boolean[grafo.getSize()];
		List<T> lista = new LinkedList<T>();
		
		
		if (grafo != null || !grafo.isEmpty()) {
			
			for (int i = 0; i < grafo.getSize(); i++) {
				if (vector[i] != false) {
					recorrerDFS(grafo,lista,vector,i);
				}
			}
		}
		
		return lista;
		
	}
	
	private void bfs(Graph<T> grafo, boolean [] vector, List<T> lista, int i) {
		Queue<Vertex<T>> cola = new Queue<Vertex<T>>(); /*cola de tipo vertice porque sera lo que ire encolando*/
		vector[i] = true;
		Vertex<T> ver = grafo.getVertex(i);
		lista.add(ver.getData());
		
		cola.enqueue(ver); /*encolo el primer vertice*/
		
		while (!cola.isEmpty()) {
			/*sacar el vertice encolado*/
			Vertex<T> v = cola.dequeue();
			/*tomar la lista de adyacentes*/
			List<Edge<T>> adyacentes = grafo.getEdges(v);
			
			for (Edge<T> arista : adyacentes) {
				int pos = arista.getTarget().getPosition();
				if (vector[pos] != false) {
					vector[pos] = true; /*marco como visitado*/
					cola.enqueue(arista.getTarget());	/*encolar cada arista del vectice desencolado*/
				}
			}
		}
	}
	
	public List<T> bfs(Graph<T> grafo){
		boolean [] vector = new boolean [grafo.getSize()];
		List<T> lista = new LinkedList<>();
		
		for (int i = 0; i < grafo.getSize(); i++) {
			if (vector[i] != false) {
				bfs(grafo,vector,lista,i);
			}
		}
		return lista;
	}
	
	
}
