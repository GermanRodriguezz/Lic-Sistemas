package ar.edu.unlp.objetos.uno.Ejercicio4Balanza;

import java.time.LocalDate;

public class Ticket {
	private LocalDate fecha;
	private int cantProd;
	private double pesoTotal;
	private double precioTotal;
	
	public Ticket(int c, double peso, double pre) {
		this.fecha = LocalDate.now();
		this.cantProd = c;
		this.pesoTotal = peso;
		this.precioTotal = pre;
	}
	
	public double getImpuesto() {
		return this.getPrecioTotal() * 0.21;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public int getCantidad() {
		return this.cantProd;
	}
	
	public double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public double getPrecioTotal() {
		return this.precioTotal;
	}
}