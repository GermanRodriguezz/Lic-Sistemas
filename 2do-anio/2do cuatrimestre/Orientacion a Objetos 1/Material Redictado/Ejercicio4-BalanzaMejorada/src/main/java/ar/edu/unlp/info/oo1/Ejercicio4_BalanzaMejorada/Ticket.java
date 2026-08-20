package ar.edu.unlp.info.oo1.Ejercicio4_BalanzaMejorada;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class Ticket {
	private LocalDate fecha;
	private int cantidadDeProd;
	private double pesoTotal;
	private double precioTotal;
	private List<Producto> prods;
	
	
	public Ticket(int cantprod, double pesot, double preciot) {
		this.fecha = LocalDate.now();
		this.cantidadDeProd = cantprod;
		this.pesoTotal = pesot;
		this.precioTotal = preciot;
		prods = new ArrayList<Producto>();
	}
	
	public double impuesto() {
		double precio = 0;
		for (Producto p : this.prods) {
			precio = p.getPrecio();
		}
		return precio * 0.21;
	}
	
	public void setFecha(LocalDate fe) {
		this.fecha = fe;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public int getCantidadDeProductos() {
		return this.prods.size();
	}
	
	public void setPesoTotal(double pe) {
		this.pesoTotal = pe;
	}
	
	public List<Producto> getProductos(){
		return this.prods;
	}
	
	public double getPesoTotal() {
		double peso = 0;
		for(Producto p : this.prods) {
			peso = p.getPeso();
		}
		return peso;
	}
	
	public double getPrecioTotal() {
		double suma = 0;
		for (Producto p : this.prods) {
			suma+= p.getPrecio();
		}
		return suma;
	}
	
	public String toString() {
		String ticket = "Fecha emitida: " + this.fecha.toString() + "\n" + "Cantidad de productos comprados: "
				+ this.cantidadDeProd + "\n" + "Peso total en productos: " + this.pesoTotal + "\n"
				+ "Total a pagar: " + this.precioTotal;
		return ticket;
	}
	
}