package tp1.ejercicio1;

public class Ejercicio1 {
			
	public static void imprimirA(int a,int b) {
		for (int i = a; i <= b; i++) {
			System.out.println(i);		
		}
	}
	
	public static void imprimirB(int a,int b) {
		int i= a;
		while (i <= b) {
			System.out.println(i);
			i++;
		}
	}
	
	public static void imprimirC(int a,int b) {
		if (a <= b) {
			System.out.println(a);
			a++;
			imprimirC(a,b);
		}
	}
	
	public static void main (String[] args) {
		imprimirA(5, 10);
		imprimirB(11, 14);
		imprimirC(15, 20);
	}
}
