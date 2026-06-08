package tp5.grafos.src.tp5.ejercicio3;

import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import java.util.*;
import java.util.Iterator;
public class Mapa {
	private Graph<String> mapaCiudades;
	
	public Mapa(Graph<String> g) {
		this.mapaCiudades = g;
	}
	/*
	 * Retorna la lista de ciudades que se deben atravesar para ir de ciudad1 a ciudad2 
	 * en caso de que se pueda llegar, si no retorna la lista vacía. 
	 * (Sin tener en cuenta el combustible).
	 * */
	
	private boolean camino(Vertex<String> origen,Vertex<String> destino, boolean [] vector, List<String> lista) {
		
		boolean encontre = false;/*condicion para cortar*/
		
		int posAct = origen.getPosition();
		vector[posAct] = true;
		
		lista.add(origen.getData());		/*agrego el dato a la lista*/
		
		if (origen.equals(destino)) {	/*encontre el destino,corto - caso base*/
			return true;
		}
		
		else {
			List<Edge<String>> adyacentes = this.mapaCiudades.getEdges(origen); /*tomo la lista de aristas*/
			
			
			Iterator<Edge<String>> it = adyacentes.iterator(); /*declaro el iterador de los adyacentes*/
			
			
			while(it.hasNext() && !encontre) { /*mientras tenga adyacentes y no haya encontrado*/
				
				Vertex<String> ver = it.next().getTarget();  /*me separo el vertice desde el iterador*/
				
				int pos = ver.getPosition();				/*tomo la posicion desde el vertice*/
				
			  /*if (!vector[pos]*/
				if (vector[pos] == false) {/*si no esta visitado llamo*/
					encontre = camino(ver,destino,vector,lista); /*con que volvio del llamado?*/
				}
			}
		}
		if (encontre == false) {	/*sino encontro el camino saco el ultimo elem*/
			lista.remove(lista.size()-1);
		}
		return encontre;
	}

	
	public List<String> devolverCamino (String ciudad1, String ciudad2){
		
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		List<String> listaResultante = new LinkedList<String>();
		if (origen != null && destino != null) {
			
			boolean [] vector = new boolean [this.mapaCiudades.getSize()];
			/*envio los dos vertices, el origen , destino y la lista resultante donde se guardara el camino*/
			camino(origen,destino,vector,listaResultante);
			
		}
		return listaResultante;
		
	}
	
	public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades){
		
	}
	
	public List<String> caminoMasCorto(String ciudad1, String ciudad2){
		
	}
	
	public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto){
		
	}
	
	public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto){
		
	}
	
	
}
