package Finales2026;

public class Oficina {
	private boolean amueblada;
	private Persona inquilino;
	private double costoDiario;
	
	
	public Oficina() {
		this.amueblada = false; /*para que cuando se inicialice sin muebles*/
		this.inquilino = null;
		this.costoDiario = 0;
	}
	
	public double getCostoDiario() { /*para aumentar */
		return this.costoDiario;
	}
	
	public boolean getAmueblada() { /* contiene muebles?*/
		return this.amueblada;
	}
	
	public Persona getInquilino() { /*si esto devuelve null no esta alquilada - si es != null esta alquilada*/
		return this.inquilino;
	}
	
	public void setCosto(double c) {
		this.costoDiario = c;
	}
	
	public void setInquilino(Persona inq) {
		this.inquilino = inq;
	}
	
	public void setAmueblada(boolean ok) {
		this.amueblada = ok;
	}
	
	
}
