package ar.edu.unlp.objetos.uno.Ejercicio3Presupuesto;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Presupuesto {
	private LocalDate fecha;
	private String cliente;
	private List<Item> items;
	
	
	public Presupuesto (String client) {
		this.cliente = client;
		this.fecha = LocalDate.now();
		this.items = new ArrayList<Item>();
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public String getCliente() {
		return this.cliente;
	}
	
	public List<Item> getList(){
		return new ArrayList<Item>(this.items);
	}
	
	public void agregarItem(Item it) {
		this.items.add(it);
	}
	
	public double calcularTotal() {
		double total = 0;
		for (Item it : this.items) {
			total += it.Costo();
		}
		return total;
	}
	
	
}