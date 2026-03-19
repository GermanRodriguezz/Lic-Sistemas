package ar.edu.unlp.objetos.uno.Ejercicio24GreenHOOme;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public abstract class Orden {
	private LocalDate fecha;
	private String domicilio;
	protected List<Producto> productos;
	
	public Orden(LocalDate fec, String dom) {
		this.fecha = fec;
		this.domicilio = dom;
		this.productos = new ArrayList<Producto>();
	}
	
	public abstract double calcularCosto();
	public abstract void agregarProducto(Producto prod);
}