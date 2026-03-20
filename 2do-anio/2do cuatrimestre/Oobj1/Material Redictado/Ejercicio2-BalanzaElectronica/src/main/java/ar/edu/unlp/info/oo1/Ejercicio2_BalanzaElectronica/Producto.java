package ar.edu.unlp.info.oo1.Ejercicio2_BalanzaElectronica;

public class Producto {
	private double peso;
	private double precioXKilo;
	private String descrip;
	
	
	public Producto(double pe, double pre, String des) {
		this.peso = pe;
		this.precioXKilo = pre;
		this.descrip = des;
	}
	
	public double getPrecio() {
		return (this.peso * this.precioXKilo);
	}
	
	public double getPeso() {
		return this.peso;
	}
}
