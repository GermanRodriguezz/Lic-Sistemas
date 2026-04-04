package ar.edu.unlp.info.oo1.Ejercicio7_FigurasCuerpos;
import java.lang.Math;


public class Circulo implements Figura2D {
	private double radio;
	
	public Circulo() {
		
	}
	
	public Circulo(double r) {
		this.radio = r;
	}
	
	public double getDiametro() {
		return this.radio * 2;
	}
	
	public void setDiametro(double diametro) {
		this.radio = diametro / 2;	
		}
	
	public double getRadio() {
		return radio;
	}
	public void setRadio(double radio) {
		this.radio = radio;
	}
	public double getPerimetro() {
		return Math.PI * this.getDiametro();
	}

	public double getArea() {
		return Math.PI * Math.pow(this.radio, 2);
	}
	
}
