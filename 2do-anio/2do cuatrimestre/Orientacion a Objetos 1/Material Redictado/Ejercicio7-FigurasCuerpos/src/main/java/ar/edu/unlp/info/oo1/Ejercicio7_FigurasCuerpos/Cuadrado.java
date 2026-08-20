package ar.edu.unlp.info.oo1.Ejercicio7_FigurasCuerpos;
import java.lang.Math;


public class Cuadrado implements Figura2D{
	private int lado;
	
	public Cuadrado() {
		
	}
	
	public Cuadrado(int l) {
		lado = l;
	}
	
	public void setLado(int l) {
		this.lado = l;
	}
	
	public int getLado() {
		return this.lado;
	}
	
	public double getPerimetro() {
		return this.lado * 4;
	}
	
	public double getArea() {
		return Math.pow(lado, 2);
	}
	

}
