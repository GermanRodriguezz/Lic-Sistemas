package tp5.grafos.src.tp5.ejercicio3;

import tp5.grafos.src.tp5.ejercicio1.Graph;
import tp5.grafos.src.tp5.ejercicio1.Vertex;
import tp5.grafos.src.tp5.ejercicio1.Edge;
import java.util.*;
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
	
	/*--------------------------------------INCISO 2----------------------------------------------*/
	/*
	 * Retorna la lista de ciudades que forman un camino desde ciudad1 a 
		, sin pasar por las ciudades que están contenidas en la lista ciudades
		 pasada por parámetro, si no existe camino retorna la lista vacía. 
		 (Sin tener en cuenta el combustible).
	 * 
	 */
	
	private boolean caminoExcepcional(Vertex<String> origen, Vertex<String> destino, boolean [] marca,List<String> lista, List<String> ciudades) {
		boolean encontre = false;
		
		int posAct = origen.getPosition();
		marca[posAct] = true;
		/*marca[origen.getPosition()];*/
		lista.add(origen.getData());
		
		/*caso base*/
		if (origen.equals(destino)) {
			return true;
		}
		else {
			List<Edge<String>> adyacentes = this.mapaCiudades.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator();
			
			while (it.hasNext() && !encontre) {
				
				Vertex<String> ver = it.next().getTarget();
				int pos = ver.getPosition();
				
				if (!marca[pos]) {
					encontre = caminoExcepcional(ver, destino, marca, lista, ciudades);
				}
			}
			}
		if (!encontre) {
			lista.remove(lista.size()-1);
		}
		return false;
	}
	
	private void marcarVertices(List<String> ciudades, boolean [] marca) {
		for (String c : ciudades) {
			Vertex<String> vertice = this.mapaCiudades.search(c);
			if (vertice != null) {
				marca[vertice.getPosition()] = true;
			}
		}
	}
	
	public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades){
		
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		boolean [] marca = new boolean [this.mapaCiudades.getSize()];
		
		
		List<String> listaResultante = new LinkedList<String>();
		
		this.marcarVertices(ciudades, marca);
		
		if (origen != null && destino != null) {
			caminoExcepcional(origen,destino,marca,listaResultante,ciudades);
		}
		
		return listaResultante;
	}
	/*------------------------------INCISO 3-------------------------------------------*/
	/*Retorna la lista de ciudades que forman el camino más corto para 
	 * llegar de ciudad1 a ciudad2, si no existe camino retorna la lista vacía. (Las rutas poseen la distancia).
	 * 
	 * 
	 * */
	
	private class Resultado {
		private int distanciaMinima;
		private List<String> mejorCamino;
		
		public Resultado() {
			this.distanciaMinima = Integer.MAX_VALUE;
			this.mejorCamino = new LinkedList<String>();
		}
	}
	
	public void caminoCorto(Vertex<String> origen, Vertex<String> destino, boolean [] marca, List<String> camino,Resultado r,int distanciaActual) {
		
		marca[origen.getPosition()] = true; /*marco el vertice como visitado*/
		
		camino.add(origen.getData()); /*agregamos la ciudad actual al camino*/
		
		if (origen.equals(destino)) { /*si encontre el destino*/
			
			if (distanciaActual < r.distanciaMinima) {
				
				r.distanciaMinima = distanciaActual;
				/*limpio el camino anterior y actualizo*/
				r.mejorCamino.clear();
				r.mejorCamino.addAll(camino);
			}
		}
		else {
			List<Edge<String>> adyacentes = this.mapaCiudades.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator();
			
			while (it.hasNext()) {
				Edge<String> e = it.next();	/*tomo la arista actual*/
				Vertex<String> ver = e.getTarget();	/*tomo el vertice destino de la arista*/
				
				if (!marca[ver.getPosition()]) {	/*si el vertice destino no fue visitado*/
					/*										acumulo la distancia recorrida hasta el nuevo vertice*/
					caminoCorto(ver,destino,marca,camino,r,distanciaActual+e.getWeight());
				}
			}
		}
		/* backtracking : elimino la ciudad actual del camino*/
		camino.remove(camino.size()-1);
		/*para que este vertice pueda ser visitado lo marco en false*/
		marca[origen.getPosition()] = false;
		
	}
	
	public List<String> caminoMasCorto(String ciudad1, String ciudad2){
		List<String> listaResultante =new LinkedList<String>();
		
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		
		boolean [] marca = new boolean [this.mapaCiudades.getSize()];
		Resultado r = new Resultado();
		
		if (origen != null && destino != null) {
			caminoCorto(origen, destino,marca,listaResultante,r,0);
			listaResultante = r.mejorCamino;
		}
		
		return listaResultante;
		
	}
	/*-----------------------------INCISO 4---------------------------------------*/
	/*
	 * Retorna la lista de ciudades que forman un camino para llegar de ciudad1 a
	 *  ciudad2. El auto no debe quedarse sin combustible y no puede cargar. 
	 *  Si no existe camino retorna la lista vacía
	 * 
	 * 
	 * */
	
	private boolean caminoSin(Vertex<String> origen, Vertex<String> destino, boolean [] marca,List<String> camino,int tanque) {
		boolean encontre = false;
		
		marca[origen.getPosition()] = true;
		
		camino.add(origen.getData());
		
		if (origen.equals(destino)) {
			encontre = true;
			return encontre;
		}
		else {
			List<Edge<String>> adyacentes = this.mapaCiudades.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator();
			
			while (it.hasNext() && !encontre) {
				
				Edge<String> e = it.next();
				Vertex<String> ver = e.getTarget();
				
				if (!marca[ver.getPosition()] && e.getWeight() <= tanque) {
					encontre = caminoSin(ver, destino, marca, camino, tanque-e.getWeight());
				}
			}
			if (!encontre) {
				camino.remove(camino.size()-1);
			}
			marca[origen.getPosition()] = false;
		}
		return encontre;
	}
	
	public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto){
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		
		boolean [] marca = new boolean [this.mapaCiudades.getSize()];
		
		List<String> listaResultante = new LinkedList<String>();
		
		if (origen != null && destino != null && tanqueAuto > 0) {
			caminoSin(origen,destino,marca,listaResultante,tanqueAuto);
		}
		
		return listaResultante;
	}
	
	/*-------------------------------------------INCISO 5---------------------------------------------*/
	/*
	 * 
	 * Retorna la lista de ciudades que forman un camino para llegar de ciudad1 a ciudad2 
		teniendo en cuenta que el auto debe cargar la menor cantidad de veces. El auto no se 
		debe quedar sin combustible en medio de una ruta, además puede completar su tanque al 
		llegar a cualquier ciudad. Si no existe camino retorna la lista vacía. 
	 * 
	 * */
	private class Cargas{
		private int minimaCarga;
		private List<String> caminoMinimo;
		
		public Cargas() {
			this.minimaCarga = Integer.MAX_VALUE;
			this.caminoMinimo = new LinkedList<String>();
		}
	}
	
	private void caminoCarga(Vertex<String> origen, Vertex<String> destino, Cargas c, List<String> lista,boolean []  marca,int restante,int tanque,int cargas) {
		marca[origen.getPosition()] = true;
		
		lista.add(origen.getData());
		
		if (cargas >= c.minimaCarga) {
			return;
		}
		
		if (origen.equals(destino)) {
			if (c.minimaCarga > cargas) {
				c.caminoMinimo.clear();
				c.caminoMinimo.addAll(lista);
				c.minimaCarga = cargas;
			}
		}
		else {
			List<Edge<String>> adyacentes = this.mapaCiudades.getEdges(origen);
			
			Iterator<Edge<String>> it = adyacentes.iterator();
			
			while (it.hasNext()) {
				
				Edge<String> e = it.next();
				Vertex<String> ver = e.getTarget();
				
				if (!marca[ver.getPosition()] && restante >= e.getWeight()) {
					caminoCarga(ver, destino, c, lista, marca, restante-e.getWeight(),tanque,cargas);
				}
				else {
					if (!marca[ver.getPosition()] && restante < e.getWeight() && e.getWeight() <= tanque) {
						caminoCarga(ver, destino, c, lista, marca, tanque - e.getWeight(), tanque, cargas+1);
					}
				}
			}
		}
		lista.remove(lista.size()-1);
		marca[origen.getPosition()] = false;
	}
	
	public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto){
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		
		boolean [] marca = new boolean [this.mapaCiudades.getSize()];
		
		List<String> listaResultante = new LinkedList<String>();
		Cargas carga = new Cargas();
		int combustibleRestante = tanqueAuto;
		if (origen != null && destino != null) {
			caminoCarga(origen,destino,carga,listaResultante,marca,combustibleRestante,tanqueAuto,0);
			listaResultante = carga.caminoMinimo;
		}
		return listaResultante;
	}
	
	
}
