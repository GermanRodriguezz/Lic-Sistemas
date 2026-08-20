package ar.edu.unlp.objetos.uno.Ejercicio15Correo;
import java.util.ArrayList;
import java.util.List;


public class ClienteDeCorreo{
	private List<Carpeta> carpetas;
	private Carpeta inbox;
	
	public ClienteDeCorreo(String nom) {
		this.inbox = new Carpeta(nom);
		this.carpetas = new ArrayList<Carpeta>();
		this.carpetas.add(this.inbox);
	}
	
	public void recibir(Email mail) {
		this.inbox.agregarMail(mail);
	}
	
	public void agregarCarpeta(Carpeta c) {
		this.carpetas.add(c);
	}
	
	public Email buscar(String txt){
									/*mapea las e para buscar  filtra en e las que cumple   final      o sino retorna null*/
		return this.carpetas.stream().map(e -> e.buscar(txt)).filter(ee -> ee.cumple(txt)).findFirst().orElse(null);
	}
	
	public int espacioOcupado() {
		return this.carpetas.stream().mapToInt(e -> e.espacioOcupado()).sum();
	}
	
}
