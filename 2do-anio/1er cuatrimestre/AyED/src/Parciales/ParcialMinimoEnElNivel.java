package Parciales;

/*
 * Sea la clase NivelArbol que tiene una variable de instancia árbol con un ArbolBinario<integer> ya
inicializado. Usted debe implementar el método minEnNivelAB(int n): ArbolBinario<Integer> que
devuelve el subárbol hoja con menor valor en el nivel n del árbol. De haber más de uno devuelve el
primero encontrado. Considere que n es un nivel válido del árbol. Sin embargo, puede suceder que no
existan hojas en ese nivel, en ese caso, debe devolver null. Realiza el recorrido por niveles*/

import tp1.ejercicio8.Queue;
import tp2.ejercicio1.BinaryTree;


public class ParcialMinimoEnElNivel {
	private BinaryTree<Integer> arbol;
	
	
	public BinaryTree<Integer> minEnElNivel(int n){
		
		if (arbol == null || arbol.isEmpty()) {
			return null;
		}
		
			BinaryTree<Integer> auxMin = null;
			
			Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
			
			cola.enqueue(arbol);
			cola.enqueue(null);
			int nivel = 0;
			
			while (!cola.isEmpty()) {
				
				BinaryTree<Integer> tree = cola.dequeue(); /*saco de la cola*/
				if (tree != null) {							/*proceso el nodo*/
					if (nivel == n && tree.isLeaf()) {		/*si estoy en el nivel y hoja*/
						if (auxMin == null || tree.getData() < auxMin.getData()) {	/*actualizo*/
							auxMin = tree;
						}
					}
				/*encolo todos los hijos del nodo*/
					if (tree.hasLeftChild())
						cola.enqueue(tree.getLeftChild());
					
					if (tree.hasRightChild())
						cola.enqueue(tree.getRightChild());
				}
				else {/*si entre al else quiere decir que tree == null osea paso al sig nivel*/
				/*si estoy en el nivel devuelvo el primero que habia encontrado*/
					if (nivel == n) {
						return auxMin;
					}
					/*aumento el nivel luego de haber encolado todos los hijos*/
					nivel++;
					
					/*si no esta vacia, encolo null para separar el nivel*/
					if (!cola.isEmpty()) {
						cola.enqueue(null);
					}
				}
			}
			return auxMin;
		}
	
}
