package ar.edu.unlp.objetos.uno.Ejercicio19AlquilerDePropiedades;

import ar.edu.unlp.objetos.uno.Ejercicio19AlquilerDePropiedades.DateLapse;
import java.util.List;

public class Propiedad {
	private String direccion;
	private String nomDescriptivo;
	private double precioXnoche;
	private List<Reserva>reservas;
	
	
	public Propiedad(String dir, String nom, double pre) {
		this.direccion = dir;
		this.nomDescriptivo = nom;
		this.precioXnoche = pre;
	}
	
	public double getPrecioxnoche() {
		return this.precioXnoche;
	}
	
	public boolean Disponibilidad(DateLapse periodo) {
		return this.reservas.stream().noneMatch(a -> a.Disponibilidad(periodo));
	}
	
	public Reserva crearReserva(DateLapse periodo,Usuario inquilino) {
		if(this.Disponibilidad(periodo)) {
			Reserva res = new Reserva(periodo,inquilino,this);
			this.reservas.add(res);
			return res;
		}
		return null;
	}
	
	public void cancelarReserva(Reserva r) {
		if (!r.estaEnCurso()){
			this.reservas.remove(r);
		}
	}
	
	public double costoTotal(DateLapse per) {
		return this.reservas.stream().filter(r -> r.Disponibilidad(per)).mapToDouble(r -> r.montoDelaReserva()).sum();
	}
}
