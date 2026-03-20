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
		return this.precioTotal + (this.precioTotal * 0.21);
	}
	
}
