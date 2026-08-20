package ar.edu.unlp.objetos.uno.Ejercicio19AlquilerDePropiedades;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String nombre;
	private String direccion;
	private int dni;
	private List<Propiedad> propiedades;
	
	public Usuario(String n, String dir , int dni) {
		this.nombre = n;
		this.direccion = dir;
		this.dni = dni;
		this.propiedades = new ArrayList<Propiedad>();
	}
	
	public void aggProp(Propiedad p) {
		this.propiedades.add(p);
	}
	
	public int cantProp() {
		return this.propiedades.size();
	}
	
	public double calcularIngresos(DateLapse p) {
		return this.propiedades.stream().mapToDouble(pr -> pr.costoTotal(p)).sum() * 0.75;
	}
}
