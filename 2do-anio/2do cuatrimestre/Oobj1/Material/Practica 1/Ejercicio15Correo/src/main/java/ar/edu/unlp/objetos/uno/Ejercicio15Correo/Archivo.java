package ar.edu.unlp.objetos.uno.Ejercicio15Correo;

public class Archivo {
	private String nombre;
	
	
	public Archivo(String n) {
		this.nombre = n;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void setNombre(String n) {
		this.nombre = n;
	}
	
	
	public int getTamanio() {
		return this.nombre.length();
	}
}
