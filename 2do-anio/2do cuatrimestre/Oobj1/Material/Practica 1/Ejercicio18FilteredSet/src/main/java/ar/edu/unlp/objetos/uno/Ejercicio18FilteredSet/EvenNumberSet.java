package ar.edu.unlp.objetos.uno.Ejercicio18FilteredSet;
import java.util.HashSet;
public class EvenNumberSet<integer> extends HashSet<integer>{
	public boolean add(integer num) {
		if ((int) num % 2 == 0) {
			return super.add(num);
		} else
			return false;
	}
	
}
