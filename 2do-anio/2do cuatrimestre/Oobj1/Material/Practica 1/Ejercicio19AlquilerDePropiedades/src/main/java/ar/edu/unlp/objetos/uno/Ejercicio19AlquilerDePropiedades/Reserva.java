package ar.edu.unlp.objetos.uno.Ejercicio19AlquilerDePropiedades;
import java.time.LocalDate;


public class Reserva {
	private DateLapse periodo;
	private Usuario inquilino;
	private Propiedad propiedad;
	
	public Reserva(DateLapse pe, Usuario inqui, Propiedad p) {
		this.periodo = pe;
		this.inquilino = inqui;
		this.propiedad = p;
	}
	
	public DateLapse getPeriodo() {
		return this.periodo;
	}
	
	public int cantDias() {
		return this.periodo.sizeInDays();
	}
	
	public double montoDelaReserva() {
		return this.propiedad.getPrecioxnoche() * this.cantDias();
	}
	
	public boolean Disponibilidad(DateLapse p) {
		return this.periodo.overlapse(p);
	}
	
	public boolean estaEnCurso() {
		LocalDate hoy = LocalDate.now();
		return !this.periodo.getfrom().isAfter(hoy) && !this.periodo.getTo().isBefore(hoy); 
			/*si hoy esta entre la fecha de inicio y la fecha de fin del periodo*/
	}
}
