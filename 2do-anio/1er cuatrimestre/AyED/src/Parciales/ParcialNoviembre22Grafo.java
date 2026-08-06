package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialNoviembre22Grafo {
	private class Estadio{
		private String nombreEstadio;
		private String nombreCiudad;
		
		public Estadio(String nomE,String nomC) {
			this.nombreEstadio = nomE;
			this.nombreCiudad = nomC;
		}
		
		public String getNombreEstadio() {
			return this.nombreEstadio;
		}
		
		public String getNombreCiudad() {
			return this.nombreCiudad;
		}
	}
	
	private Vertex<Estadio> buscarEstadio(Graph<Estadio> grafo, String estadio){
		for (Vertex<Estadio> ver : grafo.getVertices()) {
			if (ver.getData().getNombreEstadio().equals(estadio)) {
				return ver;
			}
		}
		return null;
	}
	
	private void recorrer(Graph<Estadio> grafo, boolean [] marca,Vertex<Estadio> origen,List<String> caminoMax, List<String> caminoAct, int cantkm,int kmActuales) {
		marca[origen.getPosition()] = true;
		caminoAct.add(origen.getData().getNombreEstadio());
		
		if(caminoAct.size() > caminoMax.size()) {
			caminoMax.clear();
			caminoMax.addAll(new LinkedList<String>(caminoAct));
		}
		
		
		List<Edge<Estadio>> adyacentes = grafo.getEdges(origen);
		for (Edge<Estadio> aristas : adyacentes) {
			Vertex<Estadio> ver = aristas.getTarget();
			if (!marca[ver.getPosition()] && kmActuales+aristas.getWeight() <= cantkm) {
				recorrer(grafo,marca,ver,caminoMax,caminoAct,cantkm,kmActuales+aristas.getWeight());
			}
		}
		marca[origen.getPosition()] = false;
		caminoAct.remove(caminoAct.size()-1);
	}
	
	public List<String> estadios (Graph<Estadio> mapaEstadios, String estadioOrigen, int cantKm){
		List<String> resultado = new LinkedList<String>();
		if (mapaEstadios != null && !mapaEstadios.isEmpty()) {
			
			Vertex<Estadio> origen = this.buscarEstadio(mapaEstadios, estadioOrigen);
			
			if (origen != null) {
				boolean [] marca = new boolean [mapaEstadios.getSize()];
				
				recorrer(mapaEstadios,marca,origen,resultado,new LinkedList<String>(),cantKm,0);
			}
			
		}
		return resultado;
	}
	
	
}
