package ar.edu.unlp.objetos.uno.Ejercicio9RedAlumbrado;

import java.util.List;

public class Farola {
	private List<Farola> vecinos;
	private boolean estado;
	
	public Farola() {
		this.vecinos = null;
		this.estado = false;
	}
	
	public void pairWithNeighbor(Farola otra) {
		if (!vecinos.contains(otra)) {  /*si no esta en la lista*/
			this.vecinos.add(otra);		/*lo agrego*/
			otra.pairWithNeighbor(this);/*la farola que recibo me conecta con ella*/
		}
	}
	
	public List<Farola> getNeighbors(){
		List<Farola> vecinos = this.vecinos;
		return vecinos;
	}
	
	public void turnOn() {
		if(this.estado == false) {
			this.estado = !this.estado;
			
			for (Farola vec : this.vecinos) {
				vec.turnOn();
			}
		}
	}
	
	public void turnOff() {
		if (this.estado == true) {
			this.estado = !this.estado;
			
			for (Farola vec : this.vecinos) {
				vec.turnOff();
			}
		}
	}
	
	public boolean isOn() {
		return (this.estado == true);
	}
	
	public boolean isOff() {
		return (this.estado == false);
	}
	
	
}