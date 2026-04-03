package tp1.ejercicio7;

import java.util.ArrayList;

public class CombinarOrdenado {
	
	
	public ArrayList<Integer> combinarOrd(ArrayList<Integer> l1, ArrayList<Integer> l2){
		//recorrer las listas y encontrar el minimo y agregarlo a la nueva
		ArrayList<Integer> nue = new ArrayList<Integer>();
		int pos1 = 0;
		int pos2 = 0;
		return recorrer(l1,l2,nue,pos1,pos2);
	}
	
	
	public ArrayList<Integer> agregarRestante(ArrayList<Integer> nue, ArrayList<Integer> l, int pos) {
		if (pos == l.size()) { //caso base
			return nue;
		}
		nue.add(l.get(pos)); // agrega
		return agregarRestante(nue, l, pos+1); //llama recursivamente
	}
	
	public ArrayList<Integer> recorrer(ArrayList<Integer> l1,ArrayList<Integer> l2,ArrayList<Integer> nuev, int pos1, int pos2){
			if (pos1 == l1.size()) { // si llega al final de la lista
				return agregarRestante(nuev, l2, pos2); // agrega los restantes de la otra lista
			}
			if (pos2 == l2.size()) { 
				return agregarRestante(nuev, l1, pos1);
			}
			else {
				if (l1.get(pos1) < l2.get(pos2)) { // no llego al final entonces compara
					nuev.add(l1.get(pos1)); 		//agrega
					 return recorrer(l1,l2,nuev,pos1+1,pos2); // llamo recursivamente y aumento una posicion en la lista donde encontre el minimo
				}
				else {
					nuev.add(l2.get(pos2));
					 return recorrer(l1,l2,nuev,pos1,pos2+1);
				}
			}
		}
}
