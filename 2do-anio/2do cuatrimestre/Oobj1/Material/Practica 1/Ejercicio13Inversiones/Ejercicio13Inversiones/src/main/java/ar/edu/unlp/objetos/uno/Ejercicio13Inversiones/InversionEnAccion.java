package ar.edu.unlp.objetos.uno.Ejercicio13Inversiones;

public class InversionEnAccion implements Inversion {
	private int cantidadAcciones;
	private String nombre;
	private double valorUnitario;
	
	public InversionEnAccion(String nom, int cant, double valor) {
		nombre = nom;
		cantidadAcciones = cant;
		valorUnitario = valor;
	}
	
	public int getCantAcciones() {
		return cantidadAcciones;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public double ValorActual() {
		return this.valorUnitario * this.cantidadAcciones;
	}
}