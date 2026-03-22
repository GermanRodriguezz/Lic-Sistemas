package ar.edu.unlp.info.oo1.Ejercicio4_BalanzaMejorada;

import java.util.List;
import java.util.ArrayList;
public class Balanza {

	private List<Producto> productos;
	
	public Balanza() {
		this.ponerEnCero();
	}
	
	public int getCantidadDeProductos() {
		return this.productos.size();
	}
	
	public double getPrecioTotal() {
		return this.productos.stream().mapToDouble(Producto::getPrecio).sum();
	}
	
	public double getPesoTotal() {
		return this.productos.stream().mapToDouble(Producto::getPeso).sum();
	}
	
	public void ponerEnCero() {
		this.productos = new ArrayList<Producto>();
	}
	
	public List<Producto> getProductos(){
		return this.productos;
	}
	
	public void agregarProducto(Producto prod) {
		this.productos.add(prod);
	}
	
	public Ticket emitirTicket() {
		Ticket tk = new Ticket(this.getCantidadDeProductos(),this.getPesoTotal(),this.getPrecioTotal());
		/*se pone en null la lista de productos de la balanza porque ya emitio el ticket*/
		this.ponerEnCero();
		return tk;
	}
}