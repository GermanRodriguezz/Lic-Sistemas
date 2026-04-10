package tp2.ejercicio3;

import java.util.LinkedList;

import tp2.ejercicio1.BinaryTree;

public class ContadorArbol {
	private BinaryTree<Integer> ab;
	
	public ContadorArbol(BinaryTree<Integer>a) {
		this.ab = a;
	}
	
	public LinkedList<Integer> numParesIn(){
		LinkedList<Integer> lista = new LinkedList<Integer>();
		if (!this.ab.isEmpty()) {
			this.numerosParesIn(lista,ab);
		}
		return lista;
	}
	
	public LinkedList<Integer> numParesPost(){
		LinkedList<Integer> lista = new LinkedList<Integer>();
		if (!this.ab.isEmpty())
			this.numerosParesPost(lista, ab);
		return lista;
	}
	
	public void numerosParesIn(LinkedList<Integer> lista, BinaryTree<Integer> ab){
		if (this.ab.hasLeftChild())
			numerosParesIn(lista, ab.getLeftChild());
		if (ab.getData() % 2 == 0) 
			lista.add(ab.getData());
		if (this.ab.hasRightChild())
			numerosParesIn(lista, ab.getRightChild());
	}
	
	public void numerosParesPost(LinkedList<Integer> lista, BinaryTree<Integer> a) {
		if (ab.hasLeftChild())
			numerosParesPost(lista, a.getLeftChild());
		if (ab.hasRightChild())
			numerosParesPost(lista, a.getRightChild());
		if (a.getData() % 2 == 0)
			lista.add(a.getData());
	}
	
	
}
