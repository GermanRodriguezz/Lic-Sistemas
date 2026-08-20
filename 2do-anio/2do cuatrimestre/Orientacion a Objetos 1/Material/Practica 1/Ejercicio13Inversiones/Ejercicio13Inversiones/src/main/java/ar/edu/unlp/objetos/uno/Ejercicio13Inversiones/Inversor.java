package ar.edu.unlp.objetos.uno.Ejercicio13Inversiones;
import java.util.List;
import java.util.ArrayList;

public class Inversor {
	private String nombre;
	private List <Inversion> inversiones;
	
	public Inversor(String nom) {
		this.nombre = nom;
		inversiones = new ArrayList<Inversion>(); /*creo la lista de las inversiones*/
	}
	
	
	public String getNombre() {
		return this.nombre;
	}
	public void agregarInversion(Inversion inv) {
		this.inversiones.add(inv);
	}
	
	public double ValorTotal() {
		return this.inversiones.stream().mapToDouble(inversion -> inversion.ValorActual()).sum();
	}
	
}
