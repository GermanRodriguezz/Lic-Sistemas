package ar.edu.unlp.objetos.uno.Ejercicio24GreenHOOme;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String nombreCompleto;
	private String domicilio;
	private List<Orden> ordenes;
	
	public Usuario(String nom,String dom) {
		this.nombreCompleto = nom;
		this.domicilio = dom;
		this.ordenes = new ArrayList<>();
	}
	
	public void agregarOrd(Orden ord) {
		this.ordenes.add(ord);
	}
	
	public List<Orden> getOrdenes(){
		return this.ordenes;
	}
}
