package FinalMarzo2024;

public class Empleado {
	private String nombre;
	private String apellido;
	private int antiguedad;
	
	public Empleado(String nom,String ape,int ant) {
		this.nombre = nom;
		this.apellido = ape;
		this.antiguedad = ant;
	}
	
	public String getNomApe() {
		return this.nombre + " " + this.apellido;
	}
	
	public int getAntiguedad() {
		return this.antiguedad;
	}
	
	public String toString() {
		return "Nombre Apellido " + this.getNomApe() + " Antiguedad" + this.antiguedad;
	}
	
	
}
