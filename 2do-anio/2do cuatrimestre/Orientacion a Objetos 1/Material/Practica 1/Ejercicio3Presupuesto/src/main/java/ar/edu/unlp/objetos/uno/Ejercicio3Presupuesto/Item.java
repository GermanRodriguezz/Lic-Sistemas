package ar.edu.unlp.objetos.uno.Ejercicio3Presupuesto;

public class Item {
	private String detalle;
	private int cantidad;
	private double costoUnitario;
	
	public Item(String det, int cant, double cost) {
		this.detalle = det;
		this.cantidad = cant;
		this.costoUnitario = cost;
	}
	
	
	public String getDetalle() {
		return this.detalle;
	}
	
	public int getCantidad() {
		return this.cantidad;
	}
	
	public double getCostoUnitario() {
		return this.costoUnitario;
	}
	
	public double Costo() {
		return this.costoUnitario * this.cantidad;
	}
}