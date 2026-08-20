package ar.edu.unlp.objetos.uno.Ejercicio4Balanza;

public class Producto {
	private double peso;
	private double precioPorKilo;
	private String descripcion;
	
	
	public Producto() {
		
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public double getPrecioPorKilo() {
		return this.precioPorKilo;
	}
	
	public String getDescrip() {
		return this.descripcion;
	}
	
	public double getPrecio() {
		return this.peso * this.precioPorKilo;
	}
}