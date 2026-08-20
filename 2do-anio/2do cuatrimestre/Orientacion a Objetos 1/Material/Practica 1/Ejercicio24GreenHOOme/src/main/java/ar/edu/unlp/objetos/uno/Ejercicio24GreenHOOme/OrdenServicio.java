package ar.edu.unlp.objetos.uno.Ejercicio24GreenHOOme;

import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

public class OrdenServicio extends Orden{
	private String description;
	private int horas;
	protected List<Tecnico> tecnicos;
	
	public OrdenServicio(LocalDate fec, String dom, String descrp, int hor) {
		super(fec,dom);
		this.description = descrp;
		this.horas = hor;
		this.tecnicos = new ArrayList<Tecnico>();
	}
	
	public void agregarTec(Tecnico tec) {
		this.tecnicos.add(tec);
	}
	
	public double calcularCosto() {
		double costoHorasDeTecnicos = this.tecnicos.stream().mapToDouble(h -> h.getvalorHora()).sum();
		double costoDeProductos = (this.productos.stream().mapToDouble(c -> c.getCostoProd()).sum());
		return costoHorasDeTecnicos + (costoDeProductos * this.horas);
	}
	
	public void agregarProducto(Producto pr) {
		this.productos.add(pr);
	}
}
