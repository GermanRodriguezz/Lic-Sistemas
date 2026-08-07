package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp1.ejercicio8.Queue;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialMasterClass2 {
	
	
	private class Usuario{
		private String nom;
		private int distancia;
		
		private Usuario(String n, int d) {
			this.distancia = d;
			this.nom = n;
		}
	}
	
	private void bfs(Vertex<String> origen, boolean [] marca, int dis, int lim, List<Usuario> lista,Graph<String> red) {
		marca[origen.getPosition()] = true;
		boolean puede = true;
		int nivel = 0;
		
		
		Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
		
		cola.enqueue(origen);
		cola.enqueue(null);
		
		while (!cola.isEmpty() && puede) {
			
			Vertex<String> aux = cola.dequeue();
			
			if (aux != null) {
				
				if (nivel <= dis && lista.size() < lim) {
					
					Usuario user = new Usuario(aux.getData(),nivel);
					lista.add(user);
					
				}
				else {
					if (lista.size() == lim) {
						puede = false;
					}
				}
				
				List<Edge<String>> adyacentes = red.getEdges(aux);
				
				for (Edge<String> arista : adyacentes) {
					
					if (!marca[arista.getTarget().getPosition()]) {
						
						marca[arista.getTarget().getPosition()] = true;
						cola.enqueue(arista.getTarget());
					}
				}
			}
			else {
				/*cambie el nivel*/
				nivel++;
				if (nivel > dis) {
					puede = false;
				}
				if (!cola.isEmpty()) {
					cola.enqueue(null);
				}
			}
		}
		
	}
	
	public List<Usuario> invitacionMasterClass( Graph<String> red, String usuario, int distancia, int limite){
		
		List<Usuario> lista = new LinkedList<Usuario>();
		 
		if (red != null && !red.isEmpty()) {
			
			boolean [] marca = new boolean [red.getSize()];
			
			Vertex<String> origen = red.search(usuario);
			
			bfs(origen,marca,distancia,limite,lista,red);
			
			
		}
		
		return lista;
		
		
	}
	
	
}
