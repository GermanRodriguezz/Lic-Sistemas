package ar.edu.unlp.info.oo1.Ejercicio2_BalanzaElectronica;

import java.time.LocalDate;

public class Ticket {
	private LocalDate fecha;
	private int cantidadDeProd;
	private double pesoTotal;
	private double precioTotal;
	
	
	public Ticket(int cantprod, double pesot, double preciot) {
		this.fecha = LocalDate.now();
		this.cantidadDeProd = cantprod;
		this.pesoTotal = pesot;
		this.precioTotal = preciot;
	}
	
	public double impuesto() {
		return this.precioTotal * 0.21;
	}
	
	public void setFecha(LocalDate fe) {
		this.fecha = fe;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public void setCantidadDeProductos(int c) {
		this.cantidadDeProd = c;
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadDeProd;
	}
	
	public void setPesoTotal(double pe) {
		this.pesoTotal = pe;
	}
	
	public double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public String toString() {
		String ticket = "Fecha emitida: " + this.fecha.toString() + "\n" + "Cantidad de productos comprados: "
				+ this.cantidadDeProd + "\n" + "Peso total en productos: " + this.pesoTotal + "\n"
				+ "Total a pagar: " + this.precioTotal;
		return ticket;
	}
	
	public void setPrecioTotal(double pre) {
		this.precioTotal = pre;
	}
	
	public double getPrecioTotal() {
		return this.pesoTotal;
	}
}
