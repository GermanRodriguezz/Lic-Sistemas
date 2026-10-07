package Parciales;

import tp2.ejercicio1.BinaryTree;

public class ArbolNietos2daFecha2025 {
	
	public BinaryTree<Integer> arbolDeNietos(BinaryTree<Integer> arbol) {
		//si el arbol es NULO o VACIO
        if (arbol == null || arbol.isEmpty()) {
            return new BinaryTree<Integer>();
        }
        
        BinaryTree<Integer> nuevoArbol = new BinaryTree<Integer>();
        // Llamamos al método privado auxiliar
        arbolDeNietosHelper(arbol, nuevoArbol);
        return nuevoArbol;
    }

    private int arbolDeNietosHelper(BinaryTree<Integer> original, BinaryTree<Integer> nuevo) {
        int nietosIzq = 0;
        int nietosDer = 0;

        // 1. Recorremos por la izquierda
        if (original.hasLeftChild()) {
        	// Se crea un nuevo arbol que sera asignado;
            BinaryTree<Integer> hijoIzq = new BinaryTree<Integer>();
            nuevo.addLeftChild(hijoIzq);
            // El hijo izquierdo nos devuelve cuántos hijos directos tiene
            nietosIzq = arbolDeNietosHelper(original.getLeftChild(), hijoIzq);
        }

        // 2. Recorremos por la derecha
        if (original.hasRightChild()) {
            BinaryTree<Integer> hijoDer = new BinaryTree<Integer>();
            nuevo.addRightChild(hijoDer);
            // El hijo derecho nos devuelve cuántos hijos directos tiene
            nietosDer = arbolDeNietosHelper(original.getRightChild(), hijoDer);
        }

        // 3. El dato del nuevo nodo es la suma de los hijos de sus hijos (= sus nietos)
        nuevo.setdata(nietosIzq + nietosDer);

        // 4. PROPAGACIÓN AL PADRE: contamos nuestros propios hijos directos y los retornamos
        int misHijosDirectos = 0;
        if (original.hasLeftChild()) misHijosDirectos++;
        if (original.hasRightChild()) misHijosDirectos++;

        return misHijosDirectos;
    }
		
	
}
