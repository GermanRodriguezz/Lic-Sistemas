package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialJunio2025Tema2 {
	
	private void recorrer(Graph<String> reino,boolean [] marca,List<String> ruta,List<String> actual  ,Vertex<String> origen, Vertex<String> destino,int maxPociones,int pociones) {
		
		marca[origen.getPosition()] = true;
		actual.add(origen.getData());
		
		if (origen.equals(destino)) {
			if (actual.size() > ruta.size()) {
				ruta.clear();
				ruta.addAll(new LinkedList<String>(actual));
			}
		}
		else {
			List<Edge<String>> adyacentes = reino.getEdges(origen);
			
			for (Edge<String> arista : adyacentes) {
				Vertex<String> prox = arista.getTarget();
				if (!marca[prox.getPosition()] && (pociones+arista.getWeight()) <= maxPociones) {
					 recorrer(reino,marca,ruta,actual,prox,destino,maxPociones,pociones+arista.getWeight());
				}
			}
		}
		marca[origen.getPosition()] = false;
		actual.remove(actual.size()-1);
		
	}
	
	public List<String> rutaOptimaDistribucion(Graph<String> reino, String castillo, String aldea, int maxPociones){
		List<String> ruta = new LinkedList<String>();
		
		if (reino != null && !reino.isEmpty()) {
			
			Vertex<String> origen = reino.search(castillo);
			Vertex<String> destino = reino.search(aldea);
			
			if (origen != null && destino != null) {
				boolean [] marca = new boolean[reino.getSize()];
				recorrer(reino,marca,ruta,new LinkedList<String>() ,origen,destino,maxPociones,0);
			}
			
		}
		return ruta;
	}
	
}
