package tp1.ejercicio7;

public class Estudiante {
	private String nom;
	private int legajo;
	
	public Estudiante() {
	}
	
	public Estudiante (String n, int l) {
		this.nom = n;
		this.legajo = l;
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public int getLegajo() {
		return legajo;
	}
	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}
	
	public String toString() {
		return "Nombre "+ this.nom + " Legajo " + this.legajo;
	}
}
