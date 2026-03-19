package ar.edu.unlp.objetos.uno.Ejercicio14.java;

public class Esfera extends Pieza{
	private double radio;
	
	public Esfera(String mat, String col, double r) {
		super(mat,col);
		this.radio = r;
	}
	
	
	public double calcularVolumen() {
		return (4.0 / 3.0) * Math.PI * Math.pow(radio, 3);
	}
	
	public double calcularSuperficie() {
		return 4 * Math.PI * Math.pow(radio, 2);
	}
}