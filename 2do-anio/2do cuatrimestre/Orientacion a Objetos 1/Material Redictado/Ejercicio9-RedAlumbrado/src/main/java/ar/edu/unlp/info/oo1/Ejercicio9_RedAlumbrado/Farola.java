package ar.edu.unlp.info.oo1.Ejercicio9_RedAlumbrado;

import java.util.*;

public class Farola {
	private boolean interruptor;
	private List<Farola> farolas;
	
	public Farola() {
		this.interruptor = false;
		this.farolas = new ArrayList<Farola>();
	}
	
	public void pairWithNeighbor(Farola otra) {
		if (!this.farolas.contains(otra)) { // si no esta la farola en la lista
			this.farolas.add(otra); 			// me agrego la nueva farola
			otra.pairWithNeighbor(this);	// la otraFarola me agrega
		}
	}
	
	public List<Farola> getNeighbors(){
		List<Farola> lista = this.farolas;
		return lista;
	}
	
	public  void turnOn() {
		if (this.interruptor == false) {
			this.interruptor = true; // le cambio el estado
			
			for (Farola f : this.farolas) { // recorro mis vecinos y 
				f.turnOn(); 					  // les cambio el estado
			}
		}
	}
	
	public void turnOff() {
		if (this.interruptor == true) {
			this.interruptor = false;
			
			for (Farola f : this.farolas) {
				f.turnOff();
			}
		}
	}
	
	public boolean isOn() {
		return  (this.interruptor == true);

	}
	
	public boolean isOff() {
		return (this.interruptor == false);
	}
	
}
