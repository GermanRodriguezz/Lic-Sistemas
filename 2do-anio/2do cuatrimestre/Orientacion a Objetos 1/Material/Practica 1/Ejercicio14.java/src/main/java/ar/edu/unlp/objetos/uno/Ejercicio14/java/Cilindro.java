package ar.edu.unlp.objetos.uno.Ejercicio14.java;

public class Cilindro extends Pieza{
	private double radio;
	private double altura;
	
	public Cilindro(String mat,String col, double r, double alt) {
		super(mat,col);
		this.radio = r;
		this.altura = alt;
	}
	
	public double calcularVolumen() {
		return Math.PI * (Math.pow(radio, 2)) * this.altura;
	}
	
	public double calcularSuperficie() {
		return 2 * Math.PI * this.radio * (this.altura + 2) * Math.PI * (Math.pow(radio, 2));
	}
	
}