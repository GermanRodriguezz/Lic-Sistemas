package tp5.grafos.src.tp5.ejercicio8;

import java.util.List;

import tp5.grafos.src.tp5.ejercicio1.Edge;
import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;

public class ImpulsosElectricosNeuronales {
	private Graph<String> grafo;
	
	public ImpulsosElectricosNeuronales (Graph<String> g) {
		this.grafo = g;
	}
	
	private class Resultado{
		private int cantidadNeuronas;
		
		public Resultado(int c) {
			this.cantidadNeuronas = c;
		}
	}
	
	private void dfs (boolean [] marca , Vertex<String> origen , Resultado r,int impulso) {
		
		r.cantidadNeuronas++;
		marca[origen.getPosition()] = true;
		
		List<Edge<String>> adyacentes = this.grafo.getEdges(origen);
		
		for (Edge<String> e : adyacentes) {
			/*si el destino no fue visitado y si el impulso que recibo es mayor al peso de la arista*/
			Vertex<String> v = e.getTarget();
			if (!marca[v.getPosition()] && e.getWeight() >= impulso){
				
				int nuevoImpulso = impulso - (impulso / 10);
				dfs(marca,v,r,nuevoImpulso);
			}
		}
	}
	
	public int neuronasActivadas (Graph<String> grafo, String inicio, int impulso) {
		Vertex<String> origen = this.grafo.search(inicio);
		
		Resultado r = new Resultado(0);
		
		if (origen != null) {
			boolean [] marca = new boolean [this.grafo.getSize()];
			
			dfs(marca,origen,r,impulso);
			
		}
		
		return r.cantidadNeuronas;
	}
}
