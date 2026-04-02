package tp1.ejercicio7;

import java.util.*;

public class InvertirOrden {
	private static void invertir(ArrayList<Integer> l) {
		int posF = l.size()-1;
		int posP = 0;
		inv(l,posP,posF);
	}
	
	private static void inv(ArrayList<Integer> l,int ini,int fin){
		if (ini < fin) {
			int actual = l.get(ini); // me traigo el actual donde estoy parado
			l.set(ini, l.get(fin)); // en la pos de inicio pongo el ult
			l.set(fin, actual); // en el fin pongo el actual
			inv(l,ini+1,fin-1);
		}
	}
	
	public static void main(String [] args) {
		ArrayList<Integer> lista = new ArrayList<Integer>();
		lista.add(1);
		lista.add(2);
		lista.add(3);
		lista.add(4);
		lista.add(5);
		System.out.println("Impresion de lista normal");
		for (Integer n : lista) {
			System.out.println(n);
		}
		invertir(lista);
		System.out.println("Impresion de la lista invertida");
		for (Integer n : lista) {
			System.out.println(n);
		}
	}
}
