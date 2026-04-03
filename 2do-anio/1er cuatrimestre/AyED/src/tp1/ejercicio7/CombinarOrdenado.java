package tp1.ejercicio7;

import java.util.ArrayList;

public class CombinarOrdenado {
	
	
	public ArrayList<Integer> combinarOrd(ArrayList<Integer> l1, ArrayList<Integer> l2){
		//recorrer las listas y encontrar el minimo y agregarlo a la nueva
		ArrayList<Integer> nue = new ArrayList<Integer>();
		int pos1 = 0;
		int pos2 = 0;
		int ult1 = l1.size();
		int ult2 = l2.size();
		return recorrer(l1,l2,nue,pos1,pos2,ult1,ult2);
	}
	
	public ArrayList<Integer> recorrer(ArrayList<Integer> l1,ArrayList<Integer> l2,ArrayList<Integer> nuev, int pos1, int pos2, int ult1, int ult2){
		if (!l1.isEmpty() && (!l2.isEmpty())) {
			if (l1.get(pos1) > l2.get(pos2)) {
				nuev.add(l1.get(pos1));
			}
			else {
				if (l2.get(pos2))
			}
		}
	}
}
