package ar.edu.unlp.info.oo1.RecetaDeCocina;

public abstract class Alimento {
	protected String tipo;
	protected int cantidad;
	
	public abstract String obtenerDescrip();
	
	public abstract Double costo();
}
