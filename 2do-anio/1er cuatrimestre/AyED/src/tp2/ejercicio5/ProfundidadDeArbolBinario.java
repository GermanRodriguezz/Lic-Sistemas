package tp2.ejercicio5;

import tp2.ejercicio1.*;
import tp1.ejercicio8.*;

public class ProfundidadDeArbolBinario {
	private BinaryTree<Integer> ab;
	
	public ProfundidadDeArbolBinario(BinaryTree<Integer> a) {
		ab = a;
	}
	
	public int sumaElementosProfundidad(int prof) {
		if (!this.ab.isEmpty()) 
			return sumar(ab,prof);
		return 0;
	}
	/*PORQUE PIENSO EN USAR UNA COLA?
	 * PORQUE TENEMOS QUE SUMAR HASTA CIERTA PROFUNDIDAD, POR ENDE NECESITO SABER EN QUE NIVEL ESTOY
	 * A RAIZ DE ESA LOGICA ELIGO RECORRER POR NIVELES*/
	public int sumar(BinaryTree<Integer> a, int profundidad) {
		Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
		int nivelAct = 0;
		int suma = 0;
		cola.enqueue(this.ab);		/*encolo la raiz*/
		cola.enqueue(null);			/*encolo el null que indica el 1er nivel*/
		while (!cola.isEmpty() && (nivelAct <= profundidad)) {	/*si la cola no esta vacia*/
			BinaryTree<Integer> e = cola.dequeue();		/*creo un arbol de lo que tengo en la cola*/
			if (e != null) {					/*si la cola que cree con los datos que guarde no es null*/
				if (nivelAct == profundidad)
					suma += e.getData();		/*sumo para retornar*/
				if (e.hasLeftChild())			/*encolo los hijos | luego del null que divide el nivel*/
					cola.enqueue(e.getLeftChild());
				if(e.hasRightChild())
					cola.enqueue(e.getRightChild());
			}
			else {
				if (!cola.isEmpty()) {/*cambie el nivel!!!*/
					cola.enqueue(null);						
					}
					nivelAct++;
				}
		}
	return suma;
	}
	
    public static void main (String[] args) {
        System.out.println("Imprimir suma de la profundidad");
        BinaryTree<Integer> ab = new BinaryTree<Integer>(4);
        ab.addLeftChild(new BinaryTree<Integer>(2));
        ab.addRightChild(new BinaryTree<Integer>(6));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        ab.getRightChild().addRightChild(new BinaryTree<Integer>(8));
        
        ProfundidadDeArbolBinario p = new ProfundidadDeArbolBinario(ab);
        System.out.print(p.sumaElementosProfundidad(2));
        
        
    }
}    
