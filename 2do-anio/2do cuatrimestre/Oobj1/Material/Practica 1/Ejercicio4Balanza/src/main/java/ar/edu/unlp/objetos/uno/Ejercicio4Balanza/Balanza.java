package ar.edu.unlp.objetos.uno.Ejercicio4Balanza;

import java.util.ArrayList;
import java.util.List;


public class Balanza {
	private List<Producto> produc;
	
	
	public Balanza() {
		this.ponerEnCero();
	}
	
	public void ponerEnCero() {
		this.produc = new ArrayList<Producto>();
	}
	
	public void agregarProducto(Producto p) {
		this.produc.add(p);
	}
	
	public int getCantidadProd() {
		return this.produc.size();
	}
	
	/*metodo que retorna el precio total de la balanza*/
	public double getPrecioTotal() {
		double total = 0;
		for (Producto p : this.produc) {
			total += p.getPrecio();
		}
		return total;
	}
	/* metodo que retorna el peso total de la balanza*/
	public double getPesoTotal() {
		double total = 0;
		for (Producto p : this.produc) {
			total += p.getPeso();
		}
		return total;
	}
	
	/*metodo que retorna la lista de los productos de la balanza*/
	public List<Producto> getProductos() {
		return this.produc; 
	}
	
	
	/*metodo que crea el ticket con toda la informacion obtenida de metodos anteriores*/
	public Ticket emitirTicket() {
		Ticket tk = new Ticket(this.getCantidadProd(), this.getPesoTotal(), this.getPrecioTotal());
		/*cada vez que se emita un ticket se debe reiniciar la lista de productos*/
		this.ponerEnCero();
		return tk;
	}
}