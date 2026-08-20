package ar.edu.unlp.objetos.uno.ejercicio7Figuras;

public class Circulo implements Figura2D{
	private double radio;
	private double diametro;
	
	/*Cuando se ejecuta el constructor todos los atributos de la CLASE CIRCULO toman valores solo con una entrada*/
	public Circulo(double r) {
		radio = r;
	}
	
	public double getRadio() {
		return radio;
	}
	
	public void setRadio(double r) {
		radio = r;
	}
	
	public void setDiametro(double radio) {
		diametro = radio * 2;
	}
	
	public double getDiametro() {
		return diametro;
	}
	
	public double getPerimetro() {
		return Math.PI * diametro;
	}
	
	public double getArea() {
		return Math.PI * Math.pow(this.radio,2);
	}
	
}