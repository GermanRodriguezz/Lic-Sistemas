package tp2.ejercicio4;

import tp2.ejercicio1.*;

public class RedBinariaLlena {
	private BinaryTree<Integer> arbol;
	
	public RedBinariaLlena(BinaryTree<Integer> a) {
		this.arbol = a;
	}
	
	public int retardoReenvio() {
		if (!this.arbol.isEmpty()) /* si el arbol que tengo no es vacio entonces*/
			return recorrer(this.arbol);	/*invoco al modulo que devolvera el total*/
		return 0;
	}
	
	public int recorrer(BinaryTree<Integer> a) {
		int totalHI = 0;			/*variable donde almacenara el total de los hijos izq*/
		int totalHD = 0;			/*variable donde almacenara el total de los hijos der*/
		if (a.hasLeftChild()) 
			totalHI = recorrer(a.getLeftChild());	/*recorre por la izq*/
		if (a.hasRightChild()) 
			totalHD = recorrer(a.getRightChild()); 	/*recorre por la der*/
		return Math.max(totalHI, totalHD) + a.getData();			/*retorna el maximo entre el total hijo izq e hijo dere*/
	}
	
    public static void main (String[] args) {
        System.out.println("Test mayor retardo");
        BinaryTree<Integer> ab = new BinaryTree<Integer>(4);
        ab.addLeftChild(new BinaryTree<Integer>(2));
        ab.addRightChild(new BinaryTree<Integer>(6));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        ab.getRightChild().addRightChild(new BinaryTree<Integer>(8));
        
        RedBinariaLlena red = new RedBinariaLlena(ab);
        System.out.println("El mayor retardo posible es de: " + red.retardoReenvio() + " segundos");
    }
}
