package tp2.ejercicio1;

import tp1.ejercicio8.*;

public class BinaryTree<T> {
	private T data;
	private BinaryTree <T>leftChild;
	private BinaryTree <T>rightChild;
	
	public BinaryTree(){
	}
	
	public BinaryTree(T dt) {
		data = dt;
		leftChild = null;
		rightChild  = null;
	}
	
	public T getData() {
		return this.data;
	}
	
	public void setdata(T dt) {
		this.data = dt;
	}
	
	public BinaryTree<T> getLeftChild(){
		return this.leftChild;
	}
	
	public BinaryTree<T> getRightChild(){
		return this.rightChild;
	}
	/*preguntar antes si hasLeftChild*/
	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}
	/*preguntar antes si hasRightChild*/
	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}
	/*elimina el hijo izquiero del arbol*/
	public void removeLeftChild() {
		this.leftChild = null;
	}
	/*elimina el hijo derecho del arbol*/
	public void removeRightChild() {
		this.rightChild = null;
	}
	/*indica si el arbol esta vacio*/
	public boolean isEmpty() {
		return (this.isLeaf() && this.getData() == null);
	}
	/*indica si el arbol no tiene hijos*/
	public boolean isLeaf() {
		return (!this.hasLeftChild()) && (!this.hasRightChild());
	}
	/*devuelve un boolean si el arbol tiene hijo izq*/
	public boolean hasLeftChild() {
		return this.leftChild != null;
	}
	/*devuelve un boolean si el arbol tiene hijo der*/
	public boolean hasRightChild() {
		return this.rightChild != null;
	}
		
	// ejercicio 2
	/*Agregue a la clase BinaryTree los siguientes métodos:
	 * 
		a) contarHojas():int Devuelve la cantidad de árbol/subárbol hojas del árbol receptor.
		
		b) espejo(): BinaryTree<T> Devuelve el árbol binario espejo del árbol receptor.
		
		c) entreNiveles(int n, m) Imprime el recorrido por niveles de los elementos del árbol
			receptor entre los niveles n y m (ambos inclusive). (0≤n<m≤altura del árbol)*/
	public int contarHojas() {
		int leftC = 0;
		int rightC = 0;
		if (this.isEmpty()) { /*si esta vacio*/
			return 0;
		}
		else if (this.isLeaf()) return 1; /*si no tiene hijos*/
		else {
			if (this.hasLeftChild())  /*si tiene hijo izq*/
				leftC += this.leftChild.contarHojas(); 	/*cuenta desde el mas a la izq*/
			if (this.hasRightChild())					/*si tiene hijo der*/
				rightC += this.rightChild.contarHojas();
			return leftC + rightC;
		}
	}
	
	public BinaryTree<T> espejo(){
		/*creo un nuevo arbol*/
		BinaryTree<T> arbolEspejo = new BinaryTree<T>(this.getData());
		
		if (this.hasLeftChild()) { /*si tiene hijo izq copio en el hijo der del arbol nuevo*/
			arbolEspejo.addRightChild(this.getLeftChild().espejo());;
		}
		if (this.hasRightChild()) { /*si tiene hijo der copio en el hijo izq del arbol nuevo*/
			arbolEspejo.addLeftChild(this.getRightChild().espejo());
		}
		return arbolEspejo;
	}
	
	public void recorridoPorNiveles(int n, int m) {
		Queue<BinaryTree<T>> q = new Queue<BinaryTree<T>>();
		int contadorNivel = 0;
		
		if (!this.isEmpty()) {
			q.enqueue(this); // guardo raiz
			q.enqueue(null); //guardo null para indicar el nivel
			while (!q.isEmpty()) { // la cola esta vacia?
				BinaryTree<T> e = q.dequeue(); // creo un arbol para el nivel con lo que encole antes
				if (e != null) { // el arbol es distinto de null?
					if (contadorNivel >= n && contadorNivel <= m)
						System.out.print(e.getData() + " ");
					if (e.hasLeftChild())
						q.enqueue(e.getLeftChild());
					if (e.hasRightChild())
						q.enqueue(e.getRightChild());
				}
				else // entra aca cuando e == null osea cuando ya (en este caso imprimio todo los del mismo nivel)
				if (!q.isEmpty()) {
					q.enqueue(null);
					System.out.println(); // cambio de nivel
					contadorNivel++; 
				}
			}
		}
		else System.out.println("árbol vacío");
	}
}
