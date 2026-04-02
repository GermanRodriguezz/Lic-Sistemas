package tp1.ejercicio7;
import java.util.*;
public class SumaElementosLinkedList {

	public int sumarLinkedList (LinkedList<Integer> lista) {
		Iterator <Integer> it = lista.iterator();
		return sumar(it);
	}
	
	
	public static Integer sumar(Iterator<Integer> it) {
		if (it.hasNext() == false){
			return 0;
		}
		else {
			Integer suma = it.next();
			return suma + sumar(it);
		}
	}
}
