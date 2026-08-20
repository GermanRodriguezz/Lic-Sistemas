package ar.edu.unlp.objetos.uno.Ejercicio13Inversiones;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PlazoFijo implements Inversion{
	private LocalDate fecha;
	private double montoDepositado;
	private double interesDiario;
	
	public PlazoFijo(LocalDate fec, double mont, double intDia) {
		this.fecha = fec;
		this.montoDepositado = mont;
		this.interesDiario = intDia;
	}
	
	public LocalDate getFecha() {
		return fecha;
	}
	
	public double getMontoDepositado() {
		return montoDepositado;
	}
	
	public double getInteresDiario() {
		return interesDiario;
	}
	
	public double ValorActual() {
		double cantidadDias = ChronoUnit.DAYS.between(fecha, LocalDate.now());
		return this.montoDepositado + (this.montoDepositado * this.interesDiario * cantidadDias);
	}
	
}