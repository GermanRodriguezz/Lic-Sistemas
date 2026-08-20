package ar.edu.unlp.objetos.uno.Ejercicio14.java;

import java.util.ArrayList;
import java.util.List;;

public class ReporteDeConstruccion{
	private List<Pieza> piezas;
	
	
	public ReporteDeConstruccion() {
		piezas = new ArrayList<Pieza>();
	}
	
	public void agregarPieza(Pieza p) {
		piezas.add(p);
	}
	
	public double volumenDeMaterial(String nomMaterial) {
		return this.piezas.stream().filter(p -> p.getMaterial().equals(nomMaterial)).mapToDouble(p -> p.calcularVolumen()).sum();
	}
	
	public double superficieDeMaterial(String nomColor) {
		return this.piezas.stream().filter(p -> p.getColor().equals(nomColor)).mapToDouble(p -> p.calcularSuperficie()).sum();
	}
	
}