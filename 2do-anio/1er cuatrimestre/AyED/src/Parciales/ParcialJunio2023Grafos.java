package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialJunio2023Grafos {
	
	private class info{
		private int cantidadCuadras;
		private List<String> lista;
		
		public info(List<String> lis, int cant) {
			this.cantidadCuadras = cant;
			this.lista = lis;
		}
	}
	
	private void marcarVisitados(List<String> lista, Graph<String> sitios, boolean [] marca) {
		
		for (String sitio : lista) {
			Vertex<String> sit = sitios.search(sitio);
			/*asumo que cada elemento de la lista se encuentra dentro del grafo*/
			marca[sit.getPosition()] = true;
		}
	}
	
	private void recorrer(Graph<String> sitios, boolean [] marca, List<info> caminos, List<String> caminoAct,Vertex<String> origen, Vertex<String> destino,int cuadras) {
		marca[origen.getPosition()] = true;
		caminoAct.add(origen.getData());
		
		if (origen.equals(destino)) {
			info inf = new info(new LinkedList<String>(caminoAct),cuadras);
			caminos.add(inf);
		}
		else {
			List<Edge<String>> adyacentes = sitios.getEdges(origen);
			
			for (Edge<String> arista : adyacentes) {
				Vertex<String> prox = arista.getTarget();
				if (!marca[prox.getPosition()]) {
					recorrer(sitios,marca,caminos,caminoAct,prox,destino,cuadras+arista.getWeight());
					
				}
			}
		}
		marca[origen.getPosition()] = false;
		caminoAct.remove(caminoAct.size()-1);
	}

	
	public List<info> resolver (Graph<String> sitios, String origen, String destino,List<String> evitarPasarPor) {
		List<info> caminos = new LinkedList<info>();
		
		if (sitios != null && !sitios.isEmpty()) {
			
			Vertex<String> or = sitios.search(origen);
			Vertex<String> des = sitios.search(destino);
			
			if (or != null && des != null) {
				boolean [] marca = new boolean [sitios.getSize()];
				marcarVisitados(evitarPasarPor,sitios,marca);
				recorrer(sitios,marca,caminos,new LinkedList<String>(),or,des,0);
			}
		}
		return caminos;
	}
	
}
