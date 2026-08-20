package ar.edu.unlp.info.oo1.Ejercicio8_Mamifero;

import java.time.*;

public class Mamifero {
	private String iden;
	private String especie;
	private LocalDate fechaNaci;
	private Mamifero Padre;
	private Mamifero Madre;
	
	public Mamifero() {
	}
	
	public Mamifero(String ide) {
		this.iden = ide;
	}

	public String getIdentificador() {
		return this.iden;
	}

	public void setIdentificador(String iden) {
		this.iden = iden;
	}

	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public LocalDate getFechaNaci() {
		return fechaNaci;
	}

	public void setFechaNaci(LocalDate fechaNaci) {
		this.fechaNaci = fechaNaci;
	}

	public Mamifero getPadre() {
		return Padre;
	}

	public void setPadre(Mamifero padre) {
		this.Padre = padre;
	}

	public Mamifero getMadre() {
		return Madre;
	}

	public void setMadre(Mamifero madre) {
		this.Madre = madre;
	}
	
	public Mamifero getAbueloMaterno() {
		if (this.Madre != null) {
			return this.Madre.getPadre();
		}
		return null;
	}
	
	public Mamifero getAbuelaMaterna() {
		if (this.Madre != null) {
			return this.Madre.getMadre();
		}
		return null;
	}
	
	public Mamifero getAbueloPaterno() {
		if (this.Padre != null) {
			return this.Padre.getPadre();
		}
		return null;
	}
	
	public Mamifero getAbuelaPaterna() {
		if (this.Padre != null) {
			return this.Padre.getMadre();
		}
		return null;
	}
	
	public boolean tieneComoAncestroA(Mamifero unMamifero) {
		if (unMamifero == null) { // recibo un objeto vacio
			return false; 			   // devuelvo false
		}
		if (this.Madre != null) {
			if ((this.Madre.equals(unMamifero)) || (this.Madre.tieneComoAncestroA(unMamifero))){
				return true;
			}
		}
		if (this.Padre != null) {
			if ((this.Padre.equals(unMamifero)) || (this.Padre.tieneComoAncestroA(unMamifero))){
				return true;
			}
		}
		return false;
	}
}
