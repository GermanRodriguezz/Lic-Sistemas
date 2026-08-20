package ar.edu.unlp.objetos.uno.ejercicio7Figuras;

public class Cuadrado implements Figura2D{
	private double lado;

	
	
	/*Constructor que inicializa la instaciacion de la clase CUADRADO con un valor ya*/
	public Cuadrado(double l) {
		lado = l;
	}
	
	
	public void setLado(double l) {
		lado = l;
	}
	
	public double getLado() {
		return lado;
	}
	
	public double getPerimetro() {
		return this.lado * 4;
	}
	
	public double getArea() {
		return Math.pow(lado,2);
	}
}