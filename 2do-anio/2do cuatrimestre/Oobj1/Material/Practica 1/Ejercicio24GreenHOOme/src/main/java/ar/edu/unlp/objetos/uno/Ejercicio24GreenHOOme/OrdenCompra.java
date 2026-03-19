package ar.edu.unlp.objetos.uno.Ejercicio24GreenHOOme;

import java.time.LocalDate;

public class OrdenCompra extends Orden{
	private Double precioEnvio;
	
	public OrdenCompra(LocalDate fec, String dom, double pre) {
		super(fec, dom);
		this.precioEnvio = pre;
	}
	
	public double getPrecioEnvio() {
		return this.precioEnvio;
	}
	
	
	public double calcularCosto() {
		return this.productos.stream().mapToDouble(p -> p.getCostoProd()).sum();
	}
	
	public void agregarProducto(Producto pr) {
		this.productos.add(pr);
	}
}
