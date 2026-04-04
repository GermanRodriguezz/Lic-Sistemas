package ar.edu.unlp.info.oo1.Ejercicio7_FigurasCuerpos;

public class Cuerpo3D {
	private int altura;
	private Figura2D caraBasal; // La cara basal es de tipo Figura2D debido que puede ser un circulo o un cuadrado
	
	public Cuerpo3D() {
	}
	
	public Cuerpo3D(int al,Figura2D cara) {
		this.altura = al;
		this.caraBasal = cara;
	} 
	
	public void setAltura(int altura) {
		this.altura = altura;
	}
	
	public int getAltura() {
		return altura;
	}
	
	public void setCaraBasal(Figura2D caraBasal) {
		this.caraBasal = caraBasal;
	}
	
	public double getVolumen() {
		return this.caraBasal.getArea() * this.altura;
	}
	
	public double getSuperficieExterior() {
		return 2 * caraBasal.getArea() + caraBasal.getPerimetro() * this.altura;
	}
	
	
	
	
}
