package ar.edu.unlp.info.oo1.Ejercicio3_Presupuesto;

public class Item {
	private String detalle;
	private int cantidad;
	private double costoUnitario;
	
	public Item(String det, int cant, double cos) {
		this.detalle = det;
		this.cantidad = cant;
		this.costoUnitario = cos;
	}
	
	public int getCantidad() {
		return this.cantidad;
	}
	
	public void setCantidad(int cant) {
		this.cantidad = cant;
	}
	
	public double getCostoUnitario() {
		return this.costoUnitario;
	}
	
	public void setCostoUnitario(double cos) {
		this.costoUnitario = cos;
	}
	
	public String getDetalle() {
		return this.detalle;
	}
	
	public void setDetalle(String det) {
		this.detalle = det;
	}
	
	public double costo() {
		return this.costoUnitario * this.cantidad;
	}
	
}
