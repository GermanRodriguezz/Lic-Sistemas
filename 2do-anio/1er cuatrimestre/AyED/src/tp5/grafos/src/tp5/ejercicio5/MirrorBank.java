package tp5.grafos.src.tp5.ejercicio5;

import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Vertex;
import java.util.*;


import tp1.ejercicio8.*;
import tp1.ejercicio8.Queue;

public class MirrorBank {
	private Graph<Persona> grafo;

	public MirrorBank(Graph<Persona> grafo) {
		this.grafo = grafo;
	}

	private List<Persona> bfs(Vertex<Persona> origen, int grado,List<Persona> cartera) {
		int nivel = 0;
		boolean [] marca = new boolean [grafo.getSize()];
		Queue<Vertex<Persona>> cola = new Queue<Vertex<Persona>>();
		marca[origen.getPosition()] = true;
		
		cola.enqueue(origen);/*encolamos raiz*/
		cola.enqueue(null); /*encolamos null para separar el nivel*/
		
		
		while (!cola.isEmpty()) {
			/*desencolamos la raiz en una variable*/
			Vertex<Persona> v = cola.dequeue();
			
			if (v != null) {	/*si es distinto de null quiere decir que sigo en el nivel*/
				if (v.getData() instanceof Jubilado ) {
					/*si , no cobro, la cartera no tiene 40 jubilados y el nivel es permitido*/
					if (!v.getData().getCobro() && cartera.size() < 40 && nivel < grado) {
						/*de ese modo agrego a la lista*/
						cartera.add(v.getData());
					}
				}
				List<Edge<Persona>> adyacentes = this.grafo.getEdges(v); /*tomo lista de adyacentes del vertice origen*/
				Iterator<Edge<Persona>> it = adyacentes.iterator();
				
				while (it.hasNext()) {
					Edge<Persona> arista = it.next();		/*tomo la arista*/
					Vertex<Persona> vertice = arista.getTarget();	/*agarro el vertice*/
					if (!marca[vertice.getPosition()]) {		/*si no fue visitado*/
						marca[vertice.getPosition()] = true;	/*lo marco como visitado*/
						cola.enqueue(vertice);					/*encolo los vertices adyacentes no visitados*/
					}
				}
			}
			else {
				nivel++;
				if (nivel == grado) {
					return cartera;
				}
				
				if(cartera.size() == 40) {
					return cartera;
				}
				
				if (!cola.isEmpty()) {
					cola.enqueue(null);
				}
			}
		}
		return cartera;
	}
	
	public List<Persona> retornarJubiladosEnDistancia(Graph<Persona> grafo,Empleado e,int grado){
		
		Vertex<Persona> origen = grafo.search(e);
		
		List<Persona> listaResultante = new LinkedList<Persona>();
		if (origen != null) {
			listaResultante = bfs(origen,grado,listaResultante);
		}
		return listaResultante;
	}
	

}
