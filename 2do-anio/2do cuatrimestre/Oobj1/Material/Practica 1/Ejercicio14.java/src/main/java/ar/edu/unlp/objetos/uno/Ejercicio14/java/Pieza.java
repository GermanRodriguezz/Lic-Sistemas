package ar.edu.unlp.objetos.uno.Ejercicio14.java;

public abstract class Pieza{
	public String material;
	public String color;
	
	public Pieza(String mat, String color) {
		this.material = mat;
		this.color = color;
	}
	
	public String getMaterial() {
		return this.material;
	}
	
	public String getColor() {
		return this.color;
	}
	public abstract double calcularVolumen();
	public abstract double calcularSuperficie();
}