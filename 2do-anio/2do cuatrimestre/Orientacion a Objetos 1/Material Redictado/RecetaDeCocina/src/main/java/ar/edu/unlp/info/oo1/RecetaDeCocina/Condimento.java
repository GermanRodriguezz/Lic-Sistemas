package ar.edu.unlp.info.oo1.RecetaDeCocina;

public class Condimento extends Alimento{
	private Boolean picante;
	
	public String obtenerDescrip() {
		String esPicante = "";
		if (picante) esPicante = "Integral";
		else esPicante = "Tradicional";
			
		return "Base de  " + this.tipo + ", " + esPicante + ", " + this.cantidad + "porciones";
	}
	
	public Double costo() {
		return 0.0;
	}
}
