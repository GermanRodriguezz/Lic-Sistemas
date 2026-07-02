package Parciales;

import tp2.ejercicio1.BinaryTree;

public class ParcialCaminoPrincesa {
	private BinaryTree<Personaje> arbol;
	
	private class Personaje {
		private String name;
		
		public Personaje() {}
		
		public String getNombre() {
			return this.name;
		}
	}
	
	private boolean buscar(BinaryTree<Personaje> a, Personaje per) {
		boolean corte = false;
		
		if (a.equals("Princesa")) {
			per = a.getData();
			return true;
		}
		else {
			if (a.equals("Dragon")) {
				return false;
			}
		}
		if (a.hasLeftChild() && !corte) {
			buscar(a.getLeftChild(),per);
		}
		if (a.hasRightChild() && !corte) {
			buscar(a.getRightChild(),per);
		}
		return corte;
	}
	
	
	public Personaje princesaAccesible(BinaryTree<Personaje> ar) {
		
		Personaje pers = null;
		
		if (!ar.isEmpty() || ar != null) {
			
			if (buscar(ar,pers)){
				return pers;
			}
			
		}
		
		return pers;
	}
	
}
