package ar.edu.unlp.objetos.uno.Ejercicio24GreenHOOme;

public class Tecnico {
	private String nameCompleto;
	private String especiality;
	private double valorHora;
	
	public Tecnico(String name, String espe, double valor) {
		this.nameCompleto = name;
		this.especiality = espe;
		this.valorHora = valor;
	}
	
	public double getvalorHora() {
		return this.valorHora;
	}
}
