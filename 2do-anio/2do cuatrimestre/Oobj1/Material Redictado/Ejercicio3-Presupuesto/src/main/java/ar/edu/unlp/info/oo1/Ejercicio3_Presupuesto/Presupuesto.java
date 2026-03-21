package ar.edu.unlp.info.oo1.Ejercicio3_Presupuesto;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Presupuesto {
	private LocalDate fecha;
	private String cliente;
	private List<Item> items;
	
	public Presupuesto(String cle) {
		fecha = LocalDate.now();
		cliente = cle;
		items = new ArrayList<Item>();
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public void setFecha(LocalDate fe) {
		this.fecha = fe;
	}
	
	public String getCliente() {
		return this.cliente;
	}
	
	public void setCliente(String cl) {
		this.cliente = cl;
	}
	
	/*se crea un arrayList de tipo Item de la lista que tengo como atributo*/
	public List<Item> getItems(){
		return new ArrayList <Item>(this.items);
	}
	
	public void agregarItem(Item it) {
		this.items.add(it);
	}
	
	public double calcularTotal() {
		double suma = 0;
		for (Item it : this.items) {
			suma+= it.costo();
		}
		return suma;
	}
}
