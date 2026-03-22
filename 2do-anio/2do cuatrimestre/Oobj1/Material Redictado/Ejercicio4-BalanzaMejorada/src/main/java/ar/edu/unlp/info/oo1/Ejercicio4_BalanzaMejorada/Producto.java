package ar.edu.unlp.info.oo1.Ejercicio4_BalanzaMejorada;

public class Producto {
	private double peso;
	private double precioXKilo;
	private String descrip;
	
	
	public Producto(String des, double pre, double pe) {
		this.peso = pe;
		this.precioXKilo = pre;
		this.descrip = des;
	}
	
	public void setPrecioPorKilo(double pre) {
		this.precioXKilo = pre;
	}
	
	public double getPrecioPorKilo() {
		return this.precioXKilo;
	}
	
	public void setDescripcion(String des) {
		this.descrip = des;
	}
	
	public void setPeso(double pe) {
		this.peso = pe;
	}
	
	public double getPrecio() {
		return (this.peso * this.precioXKilo);
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public String getDescripcion() {
		return this.descrip;
	}

}

