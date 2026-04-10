package tp2.ejercicio6;

import tp2.ejercicio1.*;


public class Transformacion {
	private BinaryTree<Integer> arbol;
	
	public Transformacion(BinaryTree<Integer> a) {
		arbol = a;
	}
	
	public BinaryTree<Integer> getAb(){
		return this.arbol;
	}
	
	public BinaryTree<Integer> suma(){
		if (this.arbol == null || this.arbol.isEmpty())
			return null;
		transformar(this.arbol);
		return this.arbol;
	}
	
	public int transformar(BinaryTree<Integer> a) {
		int suma = 0;
		if (!a.hasLeftChild() && !a.hasRightChild()) {
			suma = a.getData();
			a.setdata(0);
			return suma;
		}
		
		if (a.hasLeftChild()) 
			suma += transformar(a.getLeftChild()); 
		if (a.hasRightChild()) 
			suma += transformar(a.getRightChild());
		
		int valor = a.getData(); /*ME GUARDO EL VALOR DEL NODO*/
		a.setdata(suma); /* SI ESTOY EN UNA HOJA ESTA SUMA DA 0*/
		return valor + suma;	/*DEVUELVO EL VALOR DEL NODO ACT*/
	}
	
    public static void main (String[] args) {
        System.out.println("Test Transformacion");
        BinaryTree<Integer> ab = new BinaryTree<Integer>(4);
        ab.addLeftChild(new BinaryTree<Integer>(2));
        ab.addRightChild(new BinaryTree<Integer>(6));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        ab.getRightChild().addRightChild(new BinaryTree<Integer>(8));
        
        ab.imprimirArbol();
        Transformacion tras = new Transformacion(ab);
        tras.suma();
        System.out.println();
        System.out.println("Arbol transformado");
        tras.getAb().imprimirArbol();
    }
}