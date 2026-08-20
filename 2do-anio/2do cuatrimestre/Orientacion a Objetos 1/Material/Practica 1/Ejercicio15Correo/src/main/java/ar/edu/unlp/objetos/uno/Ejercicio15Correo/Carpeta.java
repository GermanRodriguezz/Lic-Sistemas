package ar.edu.unlp.objetos.uno.Ejercicio15Correo;

import java.util.ArrayList;
import java.util.List;

public class Carpeta {
	private List<Email> mails;
	private String nombre;
	
	public Carpeta(String nom) {
		this.nombre = nom;
		this.mails = new ArrayList<Email>();
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void agregarMail(Email mail) {
		this.mails.add(mail);
	}
	
	public void EliminarMail(Email mail) {
		this.mails.remove(mail);
	}
	
	public void mover(Email mail, Carpeta dest) {
		this.EliminarMail(mail);
		dest.agregarMail(mail);
	}
	
	public Email buscar(String txt) {
		return this.mails.stream().filter(e -> e.cumple(txt)).findFirst().orElse(null);
	}
	
	public int espacioOcupado() {
		return this.mails.stream().mapToInt(e -> e.getEspacio()).sum();
	}
	
}
