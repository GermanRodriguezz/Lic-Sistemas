package tp1.ejercicio7;
import java.util.*;

public class TestArrayList {
	
	
	public void main (String [] args) {
	/*Inciso A
	 * List<Integer> list = new ArrayList<Integer>();
		//recorrer los argumentos
		for (int i = 0; i < args.length; i++) {
			int numero = Integer.parseInt(args[i]);
			list.add(numero);
		}
		
		//imprimir la lista
		for (Integer n : list) {
			System.out.println(n);
		}
	*/
	/*Inciso B
	 * La diferencia que encuentro es que al usar el ArrayList los accesos los vamos a hacer directo
	 * En cambio al usar LinkedList los accesos seran mas costos en cuanto a memoria debido que se recorre de forma secuencial
	 * */
		List<Integer> list = new LinkedList<Integer>();
		//recorrer los argumentos
		for (int i = 0; i < args.length; i++) {
			list.add(Integer.parseInt(args[i]));
		System.out.println("Elementos totales de la lista " + list.size());
		}
		
		
		// Inciso C
		for (int i : list) {
			System.out.println(i);
		}
		
		Iterator <Integer> it = list.iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("Num actual " + list.get(i));
		}
		
		//Inciso D
		// 1
		List<Estudiante> listE = new LinkedList<Estudiante>();
		Estudiante e1 = new Estudiante("German Rodriguez",2329548);
		Estudiante e2 = new Estudiante("Camila Rodriguez",275340);
		Estudiante e3 = new Estudiante("Valentina Rodriguez",1167755);
		listE.add(e1);
		listE.add(e2);
		listE.add(e3);
		//2
		List<Estudiante> listECopia = new LinkedList<Estudiante>(listE); // copia superficial de la lista original esto quiere decir que apuntan al mismo objeto las dos listas
		// quiere decir, la copia crea una nueva lista, pero los elementos son compartidos, por eso al cambiar un objeto afecta ambas listas
		//3
		//imprimir lista original de estudiantes
		for (Estudiante e : listE) {
			System.out.println(e.toString());
		}
		
		for (Estudiante ec : listECopia) {
			System.out.println(ec);
		}
		
		//4 modifique algun dato de los estudiantes
		e1.setNom("Jeremias Martinez"); //pero modificando de esta manera en el inciso donde tengo que crear una lista que sea una copia se modificaran los dos nombres de las listas
		//listE.set(0, new Estudiante("no tiene", 0)); 
		
		//5
		for (Estudiante e : listE) {
			System.out.println(e.toString());
		}
		
		for (Estudiante ec : listECopia) {
			System.out.println(ec);
		}
		
	}
}
