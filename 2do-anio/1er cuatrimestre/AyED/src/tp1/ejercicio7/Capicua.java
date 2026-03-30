package tp1.ejercicio7;
import java.util.*;


public class Capicua {
	
	public Capicua() {
		
	}
	
	public boolean esCapicua(ArrayList<Integer> lista) {
		int i = 0;
		int j = lista.size()-1;
		boolean ok = true;
		if (!lista.isEmpty()) {
			while ((i < j) && ok){
				if(lista.get(i).equals(lista.get(j))) {
					i++;
					j--;
				}
				else {
					ok = false;
				}
			}
		}
		return ok;
	}
}
