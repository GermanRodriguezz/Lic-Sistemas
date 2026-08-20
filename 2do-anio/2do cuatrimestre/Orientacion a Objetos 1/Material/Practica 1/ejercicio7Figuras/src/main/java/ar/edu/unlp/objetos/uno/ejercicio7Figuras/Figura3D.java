package ar.edu.unlp.objetos.uno.ejercicio7Figuras;

public class Figura3D {
	private double altura;
	private Figura2D caraBasal;
	private double volumen;
	private double superficieExt;
	
	/*Al mismo tiempo que se construye se setean todos los valores a raiz de otros*/
	public Figura3D(double alt, Figura2D cara) {
		altura = alt;
		caraBasal = cara;
		volumen = cara.getArea() * altura;
		superficieExt = 2 * cara.getArea() + cara.getPerimetro() * altura;
	}
	
	public void setAltura(double alt) {
		altura = alt;
	}
	
	public double getAltura() {
		return altura;
	}
	
	public void setcaraBasal(Figura2D fig) {
		caraBasal = fig;
	}
	
	public double getVolumen() {
		return volumen;
	}
	
	public double getsuperficieExt() {
		return superficieExt;
	}
	
	public double getPerimetroCara() {
		return caraBasal.getPerimetro();
	}
	
	public double getAreaCara() {
		return caraBasal.getArea();
	}
	
}