package ar.edu.unlp.objetos.uno.Ejercicio24GreenHOOme;

public class Producto {
	private String name;
	private String tipomaterial;
	private Double costo;
	private boolean esBioDegradable;
	
	public Producto(String nom, String tm, double cos, boolean es) {
		this.name = nom;
		this.tipomaterial = tm;
		this.costo = cos;
		this.esBioDegradable = es;
	}
	
	public double getCostoProd() {
		return this.costo;
	}
}
