package tp3.ayed2024.src.tp3.ejercicio1;

import java.util.LinkedList;
import java.util.List;

import tp1.ejercicio8.Queue;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
	public int altura() {	 
			if (this.isLeaf())
				return  0;
			int max = 0;
			/*es decir tenes hijos*/
				List<GeneralTree<T>> children = this.getChildren();
				for (GeneralTree<T> child : children) {
					/*como cada hijo es un camino separado defino su propia alt*/
					int alt = child.altura();
					if (alt > max) max = alt;
				}
			
		return max + 1;
	}
	
	private int retornarNivel(GeneralTree<T> a, T dato) {
		if (a.getData().equals(dato)) 
			return 0;
		List<GeneralTree<T>> children = a.getChildren();
		for (GeneralTree<T> child : children) {
			int level = retornarNivel(child, dato);
			
			if (level != -1) /*esto quiere decir que encontro el dato */
				return level + 1; /*1 mas porque vuelve de un posterior llamado donde encontró el dato pero no suma en ese momento el nivel,
				 					cuando vuelve sumo el nivel que bajó*/
		}
		return -1;
	}
	
	public int nivel(T dato){
		if (!this.isEmpty() && dato != null) {
			return retornarNivel(this,dato);
		}
		return -1;
	  }

	public int ancho(){
		
		if (this.isEmpty())
			return 0;
		
		Queue<GeneralTree<T>> cola = new Queue<GeneralTree<T>>();
		cola.enqueue(this); /*encolo la raiz*/
		int max = 0;
		
		while (!cola.isEmpty()) { /*mientras la cola no este vacia*/
			int size = cola.size(); /*cantidad de nodos que tengo del nivel actual*/
			if (size > max) 
				max = size;
			for (int i = 0; i< size; i++) {		/*for para recorrer los hijos */
				GeneralTree<T> nodo = cola.dequeue(); /*nodo es lo que tiene la cola */
				List<GeneralTree<T>> children = nodo.getChildren(); /*lista de los hijos del nodo*/
				for (GeneralTree<T> child : children) {		/* recorre los hijos del nodo*/
					cola.enqueue(child);					/*encola los hijos*/
				}
			}
		}
		return max;
	}
	
	
	public boolean esAncestro(T a, T b) {
		
		if (this.isEmpty()) {
			return false;
		}
		return buscarA(this,a,b);
	}
	
	public boolean buscarB(GeneralTree<T> ab, T b) {
		if (ab.getData().equals(b)) 
			return true;
		for (GeneralTree<T> child : ab.getChildren()) {
			if (buscarB(child, b)) 
				return true;
		}
		return false;
		
	}
	
	public boolean buscarA(GeneralTree<T> ab , T a, T b) { /*recorrer hasta encontrar a A*/
		if (ab.getData().equals(a)) {
			return buscarB(this,b);							/*encontre A ahora a buscar B*/
		}
		else {
			for (GeneralTree<T> child : ab.getChildren()) {
				if (buscarA(child, a, b))
					return true;
			}
		}
		return false;
	}
}