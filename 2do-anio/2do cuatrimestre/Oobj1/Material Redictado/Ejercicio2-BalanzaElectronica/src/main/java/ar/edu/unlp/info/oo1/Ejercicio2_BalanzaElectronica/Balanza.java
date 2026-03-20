package ar.edu.unlp.info.oo1.Ejercicio2_BalanzaElectronica;

public class Balanza {
	private int cantidadProd;
	private double precioTot;
	private double pesoTot;
	
	
	public Balanza(){
	}
	
	public void ponerEnCero() {
		this.cantidadProd = 0;
		this.precioTot = 0;
		this.pesoTot = 0;
	}
	
	public void agregarProducto(Producto prod) {
		this.cantidadProd++;
		this.precioTot+= prod.getPrecio();
		this.pesoTot = prod.getPeso();
	}
	
	public Ticket emitirTicket() {
		Ticket tk = new Ticket(this.cantidadProd,this.pesoTot,this.precioTot);
		return tk;
	}
}
