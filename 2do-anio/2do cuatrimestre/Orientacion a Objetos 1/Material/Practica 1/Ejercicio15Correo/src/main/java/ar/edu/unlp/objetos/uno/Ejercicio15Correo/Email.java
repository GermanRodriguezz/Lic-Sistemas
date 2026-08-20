package ar.edu.unlp.objetos.uno.Ejercicio15Correo;

import java.util.ArrayList;
import java.util.List;

public class Email {
	private String titulo;
	private String cuerpo;
	private List<Archivo> adjunto;
	
	
	public Email(String tit, String cuerpo) {
		this.titulo = tit;
		this.cuerpo = cuerpo;
		this.adjunto = new ArrayList<Archivo>();
	}
	
	public String getTtitulo() {
		return this.titulo;
	}
	
	public String getCuerpo() {
		return this.cuerpo;
	}
	
	public List<Archivo> getAdjunto(){
		return this.adjunto;
	}
	
	public void agregarArchivo(Archivo arch) {
		this.adjunto.add(arch);
	}
	
	public int getEspacio() {
		return this.titulo.length() + this.cuerpo.length() + adjunto.stream().mapToInt(a -> a.getTamanio()).sum();
	}
	
	public boolean cumple(String txt) {
		return this.titulo.equals(txt) || this.cuerpo.equals(txt);
	}
	
}
