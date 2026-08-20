package ar.edu.unlp.info.oo1.Ejercicio2_BalanzaElectronica;

public class Balanza {
	private int cantidadProd;
	private double precioTot;
	private double pesoTot;
	
	
	public Balanza(int cant, double pre, double pes){
		this.cantidadProd = cant;
		this.precioTot = pre;
		this.pesoTot = pes;
	}
	
	public Balanza() {
		
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadProd;
	}
	
	public double getPrecioTotal() {
		return this.precioTot;
	}
	
	public double getPesoTotal() {
		return this.pesoTot;
	}
	
	public void setCantidadDeProductos(int c) {
		this.cantidadProd = c;
	}
	
	public void setPrecioTotal(double pre) {
		this.precioTot = pre;
	}
	
	public void setPesoTotal(double peso) {
		this.pesoTot = peso;
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
