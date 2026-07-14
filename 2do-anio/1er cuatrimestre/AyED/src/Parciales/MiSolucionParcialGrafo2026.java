package Parciales;

import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class MiSolucionParcialGrafo2026 {
	
	
	private class Estadio {
		private String nombre;
		private boolean esVip;
		
		
		private Estadio() {
			
		}
		
		public String getNombre() {
			return this.nombre;
		}
		
		public boolean getVip() {
			return this.esVip;
		}
		
		
	}
	
	private boolean esVip(Vertex<Estadio> vertice) {
		return vertice.getData().esVip;
	}
	
	private int recorrer(Graph<Estadio> estadios, boolean [] marca, Vertex<Estadio> origen, Vertex<Estadio> destino,int max) {
		int cant = 0;
		marca[origen.getPosition()] = true;
		
		if(this.esVip(origen)) {
			cant++;
		}
		
		if (origen.equals(destino)) {
			
			return cant;
			
		}
		
		
		List<Edge<Estadio>> adyacentes = estadios.getEdges(origen);
		
		for (Edge<Estadio> ady : adyacentes) {
			Vertex<Estadio> ver = ady.getTarget();
			if (!marca[ver.getPosition()]) {
				
				cant += recorrer(estadios,marca,ver,destino,max);
				
			}
		}
		
		if (cant > max) {
			max = cant;
		}
		
		marca[origen.getPosition()] = false;
		return max;
		
	}
	
	
	public int resolver(Graph<Estadio> estadios, String origen, String destino) {
		
		int cant = -1;
		
		if (estadios != null && !estadios.isEmpty()) {
			
			Vertex<Estadio> or = estadios.search(origen);
			Vertex<Estadio> des = estadios.search(destino);
			
			if (or != null && des != null) {
				boolean [] marca = new boolean [estadios.getSize()];
				cant = recorrer(estadios,marca,or,des,Integer.MIN_VALUE);
				
			}
			
		}
		
		return cant;
		
	}
}
