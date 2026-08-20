package ar.edu.unlp.objetos.uno.ejercicio2Balanza;

public class Balanza {
	private int cantidadDeProd;
	private double precioTotal;
	private double pesoTotal;

	
	public Balanza () {
		
	}
	
	public Balanza (int cant, double precio, double peso) {
		this.cantidadDeProd = cant;
		this.precioTotal = precio;
		this.pesoTotal = peso;
	}

	int getCantidadDeProductos() {
		return this.cantidadDeProd;
	}
	
	double getPrecioTotal() {
		return this.precioTotal;
	}
	
	double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public void ponerEnCero() {
		this.cantidadDeProd = 0;
		this.precioTotal = 0;
		this.pesoTotal = 0;
	}
	/* se aumenta un producto, se acumula precio y peso tambien */
	public void agregarProducto(Producto prod) {
		this.cantidadDeProd++;
		this.precioTotal += prod.getPrecio();
		this.pesoTotal += prod.getPeso();
	}
	
	/* el ticket se emite con los datos que tiene la balanza */
	
	public Ticket emitirTicket() {
		Ticket tk = new Ticket(this.cantidadDeProd, this.pesoTotal, this.precioTotal);
		return tk;
	}
}

