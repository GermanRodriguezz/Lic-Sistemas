package tp1.ejercicio7;
import java.util.*;
// inciso g
public class Sucesion {
	
	public static List<Integer> calcularSucesion(int n){
		List<Integer> s = new LinkedList<Integer>(); // creo la lista vacia
		calcular(s,n); // llamo al metodo recursivo
		return s; // cuando vuelve de las llamadas recursivas, devuelvo
		}
	private static void calcular(List<Integer> suce, int n) {
		suce.add(n); // primero agrego
		if (n >1) { // pregunto para llamar recursivo, de caso contrario seria el caso base n = 1, entonces no ejecuta el codigo y comienza a volver
			if (n % 2 == 0) {
				calcular(suce,n/2);
			}
			else {
				calcular(suce,(3*n)+1);
			}
		}
		
	}
	
	public static void main (String [] args) {
		System.out.print(calcularSucesion(10));
	}
}	
