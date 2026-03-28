package tp1.ejercicio5;

public class Calculos {
	private static Datos dt;
	public Calculos() {
	}
	
	public static Datos metodoA(int [] array) {
		int max = Integer.MAX_VALUE;
		int min = Integer.MIN_VALUE;
		double suma = 0;
		for (int i = 0; i < array.length; i++) {
			if (array[i] > max) {
				max = array[i];
			}
			if (array[i] < min) {
				min = array[i];
			}
			suma += array[i];
		}
		double prom = suma/array.length;
		Datos dat = new Datos (max,min,prom);
		return dat;
	}
	/*en este metodo se recibe el arreglo y ademas un objeto que obtendra los valores
	 de su instancia recorriendo el vector a traves de los setters*/
	public static void metodoB(int [] array, Datos d) {
		int max = Integer.MAX_VALUE;
		int min = Integer.MIN_VALUE;
		double suma = 0;
		for (int i = 0; i < array.length; i++) {
			if (array[i] > max) {
				max = array[i];
			}
			if (array[i] < min) {
				min = array[i];
			}
			suma += array[i];
		}
		double prom = suma/array.length;
		d.setMaximo(max);
		d.setMinimo(min);
		d.setPromedio(prom);
	}
	
	
	/*en este metodo es cuando me doy cuenta que para devolver los datos sin un parametro con el objeto
	 * lo que debo hacer es declarar el objeto en esta clase para retornarlo en el metodo
	 * DevolverDatos, en este metodo le cargo los valores*/
	public static void moduloC(int [] array) {
		int max = Integer.MAX_VALUE;
		int min = Integer.MIN_VALUE;
		double suma = 0;
		
		for (int i = 0; i < array.length; i++) {
			if (array[i] > max) {
				max = array[i];
			}
			if (array[i] < min) {
				min = array[i];
			}
			suma += array[i];
		}
		dt = new Datos();
		dt.setMaximo(max);
		dt.setMinimo(min);
		dt.setPromedio(suma/array.length);
		
	}
	public static Datos devolverDatos() {
		return dt;
	}
	
}
