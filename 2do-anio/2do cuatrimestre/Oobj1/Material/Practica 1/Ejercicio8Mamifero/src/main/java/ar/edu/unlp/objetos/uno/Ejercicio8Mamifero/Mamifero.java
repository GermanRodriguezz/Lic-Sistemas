package ar.edu.unlp.objetos.uno.Ejercicio8Mamifero;
import java.time.LocalDate;


public class Mamifero {
	private String identificador;
	private String especie;
	private LocalDate fechaNacimiento;
	private Mamifero padre;
	private Mamifero madre;
	
	public String getidentificador() {
		return this.identificador;
	}
	
	public void setidentificador(String id) {
		this.identificador = id;
	}
	
	public String getEspecie() {
		return this.especie;
	}
	
	public void setEspecie(String esp) {
		this.especie = esp;
	}
	
	public LocalDate getfechaNacimiento() {
		return this.fechaNacimiento;
	}
	
	public void setfechaNacimiento(LocalDate fec) {
		this.fechaNacimiento = fec;
	}
	
	public Mamifero getpadre() {
		return this.padre;
	}
	
	public void setpadre(Mamifero p) {
		this.padre = p;
	}
	
	public Mamifero getmadre() {
		return this.madre;
	}
	
	public void setmadre(Mamifero m) {
		this.madre = m;
	}
	
	public Mamifero getAbueloMaterno() {
		if (this.madre != null) {
			return this.madre.padre;
		}
		else
			return null;
	}
	
	public Mamifero getAbuelaMaterna() {
		if (this.madre != null) {
			return this.madre.madre;
		}
		else
			return null;
	}
	
	public Mamifero getAbueloPaterno() {
		if (this.padre != null) {
			return this.padre.padre;
		}
		else
			return null;
	}
	
	public Mamifero getAbuelaPaterna() {
		if (this.padre != null) {
			return this.padre.madre;
		}
		else
			return null;
	}
	
	public boolean tieneComoAncestroA(Mamifero unMamifero) {
		if(unMamifero == null) {
			return false;
		}
		if (this.equals(unMamifero)) {
			return true;
		}
		/*    la madre es el mamifero         o       se va a fijar si la madre de la madre es!*/
		if (((this.madre.equals(unMamifero) || this.madre.tieneComoAncestroA(unMamifero))) ||
		((this.padre.equals(unMamifero) || this.padre.tieneComoAncestroA(unMamifero)))) {
			return true;
		}
		return false;
		}
	}
	