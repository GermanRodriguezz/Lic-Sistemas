package tp5.grafos.src.tp5.ejercicio4;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class VisitaOslo {
	private Graph<String> grafo;
	
	public VisitaOslo(Graph<String> g) {
		this.grafo = g;
	}
	
	
	private boolean dfs(Vertex<String> origen, Vertex<String> destino, int tiempo, List<String> lugares,List<String> camino, boolean [] marca) {
		marca[origen.getPosition()] = true;
		
		camino.add(origen.getData());
		
		boolean encontre = false;
		
		if (origen.equals(destino)) {
			return true;
		}
		else {
			List<Edge<String>> adyacentes = this.grafo.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator();
			
			while (it.hasNext() && !encontre) {
				
				Edge<String> arista = it.next();
				Vertex<String> ver = arista.getTarget();
				/*si no fue visitado y el tiempo no se termina*/
				if (!marca[ver.getPosition()] && tiempo - arista.getWeight() >= 0 && !lugares.contains(ver.getData())) {
					encontre = dfs(ver,destino,tiempo-arista.getWeight(),lugares,camino,marca);
				}
			}
		}
		if (!encontre) {
			camino.remove(camino.size()-1);
			marca[origen.getPosition()] = false;
		}
		return encontre;
	}
	
	public List<String> paseoEnBici(Graph<String> lugares, String destino, int maxTiempo, List<String> lugaresRestringidos){
		
		List<String> camino = new LinkedList<String>();
		
		Vertex<String> origin = lugares.search("Ayuntamiento");
		Vertex<String> destiny = lugares.search(destino);
		
		if (origin != null && destiny != null) {
			boolean [] marca = new boolean [lugares.getSize()];
			
			dfs(origin,destiny,maxTiempo,lugaresRestringidos,camino,marca);
			
		}
		return camino;
		
	}
	
	/*
	 * 
	 * Primer camino válido
    	→ corto la búsqueda
    	→ generalmente NO desmarco

	   Mejor camino entre todos
    	→ exploro todas las alternativas
    	→ SIEMPRE desmarco
	 * 
	 * 
	 * 
	 * 
	 * 
	 * */
}
