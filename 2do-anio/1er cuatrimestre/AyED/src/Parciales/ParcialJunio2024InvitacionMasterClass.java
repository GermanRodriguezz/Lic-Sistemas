package Parciales;

import java.util.LinkedList;
import java.util.List;

import tp1.ejercicio8.Queue;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ParcialJunio2024InvitacionMasterClass {
	private Graph<String> grafo;
	
	
	private class informacion {
		private String nombre;
		private int distancia;
		
		public informacion(String nom, int dis) {
			this.nombre = nom;
			this.distancia = dis;
		}
	}
	
	private void invitar(Graph<String> red, Vertex<String> origen, boolean [] marca,int distancia, int limite, List<informacion> lista) {
		int nivel = 0;
		int cantidad = 0;
		marca[origen.getPosition()] = true;
		/*cola de vertices*/
		Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
		
		
		/*encolo la raiz y el null para separar el nivel*/
		cola.enqueue(origen);
		cola.enqueue(null);
		
		while (!cola.isEmpty()) {
			
			/*saca la raiz*/
			Vertex<String> aux = cola.dequeue();
			
			/*si no desencole null*/
			if (aux != null) {
				/*controlo el nivel y la distancia*/
				if (nivel > 0 && nivel <= distancia) {
					
					informacion i = new informacion(aux.getData(),nivel);
					lista.add(i);
					
					cantidad++;
					/*controlo el limite */
					if (cantidad == limite) {
						return;
					}
				}
				/*si estoy en nivel 0 y menor que el limite*/
				List<Edge<String>> ady = red.getEdges(aux);
				/*encolo los adyacentes*/
				for (Edge<String> a : ady) {
					
					if (!marca[a.getTarget().getPosition()]) {
						marca[a.getTarget().getPosition()] = true;
						
						cola.enqueue(a.getTarget());
					}
				}		
			}
			/*si desencole null*/
			else {
				nivel++;
				if(nivel > distancia) 
					return;
				if (!cola.isEmpty()) 
					cola.enqueue(null);
			}
		}
		return;
	}
	
	
	public List<informacion> invitacionMasterClass(Graph<String> red, String usuario, int distancia, int limite){
		/*AGREGAR VERIFICACION*/
		Vertex<String> origen = red.search(usuario);
		
		List<informacion> usuarios = new LinkedList<informacion>();
		
		if (origen != null) {
			boolean [] marca = new boolean [red.getSize()];
			invitar(red,origen,marca,distancia,limite,usuarios);
		}
		
		return usuarios;
		
	}
	
}
