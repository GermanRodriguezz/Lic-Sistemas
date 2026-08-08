package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class MiSolucionParcialGrafosFlotante {

	private int recorrer(Graph<String> grafo,boolean [] marca, Vertex<String> origen,Vertex<String> destino,List<String> camino,List<String> caminoAct,int minimo,int minimoAct) {
		marca[origen.getPosition()] = true;
		caminoAct.add(origen.getData());
		
		if (origen.equals(destino)) {
			camino.clear();
			camino.addAll(new LinkedList<String>(caminoAct));
			return minimoAct;
		}
		
		
		List<Edge<String>> adyacentes = grafo.getEdges(origen);
		for (Edge<String> arista : adyacentes) {
			Vertex<String> prox = arista.getTarget();
			
			if (!marca[prox.getPosition()] && prox.getData().contains("Maldito")) {
				
				int minDelCamino = recorrer(grafo, marca, prox, destino, camino, caminoAct, minimo, minimoAct+arista.getWeight());
				if (minDelCamino < minimo) {
					minimo = minDelCamino;
				}
			}
		}
		marca[origen.getPosition()] = false;
		caminoAct.remove(caminoAct.size()-1);
		return minimo;
	}
	
	public List<String> caminoMasCorto(Graph<String> bosque){
		List<String> resultado = new LinkedList<String>();
		
		if (bosque != null && !bosque.isEmpty()) {
			
			Vertex<String> origen = bosque.search("Cabaña de Elara");
			Vertex<String> destino = bosque.search("Caldero Ancestral");
			
			if (origen != null && destino != null) {
				boolean [] marca = new boolean [bosque.getSize()];
				recorrer(bosque,marca,origen,destino,resultado,new LinkedList<String>(),Integer.MAX_VALUE,0);
				
			}
			
		}
		return resultado;
	}
		
}
