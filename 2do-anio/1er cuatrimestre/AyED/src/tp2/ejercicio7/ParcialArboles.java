package tp2.ejercicio7;

import tp2.ejercicio1.BinaryTree;
import tp2.ejercicio6.Transformacion;

public class ParcialArboles {
	private BinaryTree<Integer> ar;
	
	private BinaryTree<Integer> a1;
	private BinaryTree<Integer> a2;
	
	public ParcialArboles(BinaryTree<Integer> a) {
		this.ar = a;
	}
	
	public boolean isLeftTree(int num) {
		return buscar(num,ar);
	}
	
	public boolean buscar(int n, BinaryTree<Integer> a) {
	/*lo primero que buscamos es encontrar el numero dentro del arbol*/
		if (a.getData() != n) {
			if (a.hasLeftChild())
				buscar(n,a.getLeftChild());
			if (a.hasRightChild())	
				buscar(n,a.getRightChild());
		}
		if (a.getData() == n) {
			/*si encontre al numero en una raiz*/;
			int cantHI = 0;	
			int cantD  = 0;
			if (a.hasLeftChild())
				cantHI = verificarHijos(a.getLeftChild());
				
			else {
				cantHI = -1;
				System.out.println("no tiene subArbol izq");
			}
			if (a.hasRightChild())
				cantD = verificarHijos(a.getRightChild());
			else {
				cantD = -1;
				System.out.println("no tiene subArbol der");
			}
			System.out.println( "HI :" + cantHI + "HD :" + cantD);
			if (cantHI > cantD)
				System.out.println("ES MAS GRANDE : " + cantHI);
			else {
				System.out.println("ES MAS GRANDE : " + cantD);
			}
			return (cantHI > cantD);
		}
		return false;
		
	}
	
	public int verificarHijos(BinaryTree<Integer> a) {
		int hijos = 0;
		if (a.hasLeftChild()) {
			if (!a.hasRightChild()) {
				hijos++;
				System.out.println("Sumo uno en el hijo izq");
			}
			verificarHijos(a.getLeftChild());
		}
		if (a.hasRightChild()) {
			if (!a.hasLeftChild()) {
				hijos++;
				System.out.println("Sumo uno en el hijo der");
			}
			verificarHijos(a.getRightChild());
		}
		return hijos;
	}

	
	/*metodo es prefijo
	 * El método devuelve true si arbol1 es prefijo de arbol2, false en caso contrario.
	Se dice que un árbol binario arbol1 es prefijo de otro árbol binario arbol2, cuando arbol1 coincide
	con la parte inicial del árbol arbol2 tanto en el contenido de los elementos como en su
	estructura. Por ejemplo, en la siguiente imagen: arbol1 ES prefijo de arbol2.*/
	
	public boolean esPrefijo(BinaryTree<Integer> a1 , BinaryTree<Integer> a2) {
	    if (!a1.isEmpty() && !a2.isEmpty()) 
	        return recorrido(a1,a2);
	    else 
	        return false;
	}

	public boolean casoBase(BinaryTree<Integer> a1, BinaryTree<Integer> a2) {
	    return a1.getData().equals(a2.getData());
	}

	public boolean recorrido(BinaryTree<Integer> a1, BinaryTree<Integer> a2) {

	    // comparo contenido
	    if (!casoBase(a1, a2)) 
	        return false;

	    // hijo izquierdo
	    if (a1.hasLeftChild()) {
	        if (a2.hasLeftChild()) {
	            if (!recorrido(a1.getLeftChild(), a2.getLeftChild()))
	                return false;
	        } else {
	            return false;
	        }
	    }

	    // hijo derecho
	    if (a1.hasRightChild()) {
	        if (a2.hasRightChild()) {
	            if (!recorrido(a1.getRightChild(), a2.getRightChild()))
	                return false;
	        } else {
	            return false;
	        }
	    }

	    return true;
	}
	


		
		
		
		
		
		
		
		
		
		
		
		
		
		
    public static void main (String[] args) {
        System.out.println("");
        BinaryTree<Integer> ar = new BinaryTree<Integer>(4);
        ar.addLeftChild(new BinaryTree<Integer>(2));
        ar.addRightChild(new BinaryTree<Integer>(6));
        ar.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
        ar.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        ar.getRightChild().addRightChild(new BinaryTree<Integer>(8));
        
        System.out.println("");
        
        ParcialArboles impresor = new ParcialArboles(ar);
        if (impresor.buscar(5, ar)) {
        	System.out.println("Retorno veradero");
        }
        else {
        	System.out.println("Retorno falso");
        }
    }
	
}
