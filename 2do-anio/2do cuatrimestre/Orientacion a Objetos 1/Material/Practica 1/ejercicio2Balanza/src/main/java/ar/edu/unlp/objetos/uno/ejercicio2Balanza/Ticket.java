package ar.edu.unlp.objetos.uno.ejercicio2Balanza;

import java.time.LocalDate;

public class Ticket {
	private LocalDate fecha;
	private int cantidadDeProductos;
	private double pesoTotal;
	private double precioTotal;
	
	public Ticket (int cant, double peso, double precio){
		this.fecha = LocalDate.now();
		this.cantidadDeProductos = cant;
		this.pesoTotal = peso;
		this.precioTotal = precio;
	}
	/*  sacamos el precio total del ticket y lo multiplicamos por 0.21 para sacar el 21%*/
	public double impuesto() {
		return this.precioTotal * 0.21;
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadDeProductos;
	}
	
	public double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public double getPrecioTotal() {
		return this.precioTotal;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
}