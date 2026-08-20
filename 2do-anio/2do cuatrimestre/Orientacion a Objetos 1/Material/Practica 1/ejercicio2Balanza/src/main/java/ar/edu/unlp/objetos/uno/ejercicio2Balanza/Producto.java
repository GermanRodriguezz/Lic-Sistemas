package ar.edu.unlp.objetos.uno.ejercicio2Balanza;

public class Producto {
	private double peso;
	private double precioPorKilo;
	private String descripcion;


	public Producto (String descrip,double pesoo,double precio) {
		this.descripcion = descrip;
		this.peso = pesoo;
		this.precioPorKilo = precio;
	}
	
	public double getPeso () {
		return this.peso;
	}
	
	public void setPeso(double p) {
		this.peso = p;
	}
	
	public double getPrecioPorKilo() {
		return this.precioPorKilo;
	}
	
	public void setPrecioPorKilo(double precio) {
		this.precioPorKilo = precio;
	}
	
	public String getDescripcion() {
		return this.descripcion;
	}
	
	
	public void setDescripcion(String desc) {
		this.descripcion = desc;
	}
	
	public double getPrecio() {
		return this.getPeso() * this.precioPorKilo;
	}
	
}