package FinalOctubre25;

public class Persona {
	private String nombre;
	private String apellido;
	private int dni;
	
	public Persona (String nom,String ape,int dni) {
		this.nombre = nom;
		this.apellido = ape;
		this.dni = dni;
	}
	
	
	public String getNombreApelido() {
		return this.nombre + " " + this.apellido;
	}
	
	public int getDNI() {
		return this.dni;
	}
	
	public String toString () {
		return this.getNombreApelido() + " " + this.getDNI();
	}
	
	
}
