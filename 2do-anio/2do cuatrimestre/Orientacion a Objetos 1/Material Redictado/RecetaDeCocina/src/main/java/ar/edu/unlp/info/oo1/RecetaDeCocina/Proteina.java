package ar.edu.unlp.info.oo1.RecetaDeCocina;

public class Proteina extends Alimento{
	private String formaPre;
	private Double precioXPorcion;
	
	public String obtenerDescrip() {
		return "Proteína de " + this.tipo + " en " + formaPre + this.cantidad + "porciones a $" + this.precioXPorcion + " por porción";
	}
	
	public Double costo() {
		return this.precioXPorcion * this.cantidad;
	}
}
