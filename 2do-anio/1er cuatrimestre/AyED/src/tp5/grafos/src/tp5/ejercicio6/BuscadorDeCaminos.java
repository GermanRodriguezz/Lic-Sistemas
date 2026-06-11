package tp5.grafos.src.tp5.ejercicio6;

import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class BuscadorDeCaminos {
	private Graph<String> bosque;
	
	public BuscadorDeCaminos (Graph<String> grafo) {
		this.bosque = grafo;
	}
	
	private void dfs(boolean [] marca, Vertex<String> origen, Vertex<String> destino,List<List<String>> caminos, LinkedList<String> caminoActual){
		/*agrego al camino actual */
		caminoActual.add(origen.getData());
		
		marca[origen.getPosition()] = true;
		/*si encuentro del destino*/
		if (origen.equals(destino)) {
			/*agrego una nueva lista de la actual, a la lista que devuelvo*/
			caminos.add(new LinkedList<>(caminoActual));
		}
		else {
			List<Edge<String>> adyacentes = this.bosque.getEdges(origen);
			/*por cada adyacente a*/
			for (Edge<String> a : adyacentes) {
				/*a.getTarget() me devuelve el vertice destino*/
				Vertex<String> ver = a.getTarget();
				/*si no fue visitado ese vertice y la arista hasta el vertice destino tiene costo menor a 5*/
				if (!marca[ver.getPosition()] && a.getWeight() < 5) {
					
					dfs(marca, ver, destino, caminos, caminoActual);
				}
			}
		}
		/*Backtracking
		 * desmarco para poder volver a pasar por este vertice*/
		marca[origen.getPosition()] = false;
		/*Backtracking
		 * saco el ultimo vertice agregado a la lista actual
		 * */
		caminoActual.remove(caminoActual.size()-1);
	}
	
	public List<List<String>> recorridosMasSeguros(){
		
		Vertex<String> origen = this.bosque.search("Casa Caperucita");
		Vertex<String> destino = this.bosque.search("Casa Abuelita");
		
		List<List<String>> caminos = new LinkedList<List<String>>();
			
		if (origen != null && destino != null) {
			boolean [] marca = new boolean [this.bosque.getSize()];
			this.dfs(marca,origen,destino,caminos,new LinkedList<String>());
		}	
	return caminos;
	}
	
}
