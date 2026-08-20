package ar.edu.unlp.info.oo1.RecetaDeCocina;

public class Base extends Alimento{
	private Boolean integral;
	
	public String obtenerDescrip() {
		String esIntegral = "";
		if (integral) esIntegral = "Integral";
		else esIntegral = "Tradicional";
			
		return "Base de  " + this.tipo + ", " + esIntegral + ", " + this.cantidad + "porciones";
	}
	
	public Double costo() {
		if (integral) 
			return 1500.00;
		else 
			return 2200.00;
	}
}
