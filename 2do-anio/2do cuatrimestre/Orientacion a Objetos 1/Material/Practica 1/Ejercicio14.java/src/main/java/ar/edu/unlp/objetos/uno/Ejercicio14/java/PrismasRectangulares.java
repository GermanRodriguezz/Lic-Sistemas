package ar.edu.unlp.objetos.uno.Ejercicio14.java;

public class PrismasRectangulares extends Pieza{
	private double LadoMayor;
	private double LadoMenor;
	private double altura;
	
	public PrismasRectangulares(String mat, String color, double lmy, double lmn, double alt) {
		super(mat, color);
		this.LadoMayor = lmy;
		this.LadoMenor = lmn;
		this.altura = alt;
	}
	
	public double calcularVolumen() {
		return LadoMayor * LadoMenor * altura;
	}
	
	public double calcularSuperficie() {
		return 2 * (this.LadoMayor * this.LadoMenor + this.LadoMayor * this.altura+  this.LadoMenor * this.altura);
	}
	
}