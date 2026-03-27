package tp1;
public class Ejer2 {
	
	public static void crearArreglo(int n) {
		int [] arreglo = new int[n];
		int cantidad = 0;
		while (cantidad != n) {
			arreglo[cantidad] = n * (cantidad+1);
			cantidad++;
		}
		for (int i = 0; i < arreglo.length; i++) {
			System.out.print(arreglo[i]);
		}
	}
	
	
	public static void main (String[] args) {
		crearArreglo(5);
		
	}
}
