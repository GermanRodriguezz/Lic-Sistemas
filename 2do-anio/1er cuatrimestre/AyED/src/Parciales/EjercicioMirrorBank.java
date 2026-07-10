package Parciales;

import java.util.*;

import tp1.ejercicio8.Queue;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class EjercicioMirrorBank {
	
	
	private class Persona{
		private String Nombre;
		private int dom;
		private boolean empleado;
		private boolean recibiJubi;
		
		private Persona() {
		}
		
		
		public boolean getRecibio() {
			return this.recibiJubi;
		}
		
	}
	
	private void recorrer(boolean  [] marca, Graph<Persona> g, List<Persona> lista,Vertex<Persona> origen, Persona e, int dis) {
		boolean puede = true;
		int nivel = 0;
		
		marca[origen.getPosition()] = true;
		
		Queue<Vertex<Persona>> cola = new Queue<Vertex<Persona>>();
		
		cola.enqueue(origen);
		cola.enqueue(null);
		
		while (!cola.isEmpty() && puede) {
			
			Vertex<Persona> aux = cola.dequeue(); /*sacamos lo que haya en la queue*/
			
			if (aux != null) {
				
				if (nivel == dis) {
					
					if (lista.size() <= 40 && aux.getData().empleado == false && aux.getData().recibiJubi == false) {
						lista.add(aux.getData());
					}
					else {
						if (lista.size() == 40) {
							puede = false;/*para que corte*/
						}
					}
					
				}/*si no estoy en el nivel*/
				else {
					
					List<Edge<Persona>> adyacentes = g.getEdges(aux);
					
					for (Edge<Persona> ady : adyacentes) {
						
						if (!marca[ady.getTarget().getPosition()]) {
							marca[ady.getTarget().getPosition()] = true;
							cola.enqueue(ady.getTarget());
						}
						
					}
					
				}
			}
			/*si cambie el nivel*/
			nivel++;
			
			if (nivel >= dis) {
				puede = false;
			}
			else {
				if (!cola.isEmpty())
					cola.enqueue(null);
				
			}
			
		}
		
	}
	
	
	public List<Persona> bfs (Graph<Persona> g, int distancia, Persona empleado){
		List<Persona> jubilados = new LinkedList<Persona>();
		if (g == null || g.isEmpty()) {
			return jubilados;
		}
		
		boolean [] marca = new boolean [g.getSize()];
		
		
		Vertex<Persona> origen= g.search(empleado);
		
		recorrer(marca,g,jubilados,origen,empleado,distancia);
		
		return jubilados;
	}
	
	
	
}
