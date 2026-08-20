package ar.edu.unlp.objetos.uno.Ejercicio19AlquilerDePropiedades;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateLapse {
	private LocalDate from;
	private LocalDate to;
	
	public DateLapse(LocalDate f, LocalDate t) {
		this.from = f;
		this.to = t;
	}

	public LocalDate getfrom() {
		return this.from;
	}
	
	public LocalDate getTo() {
		return this.to;
	}
	
	public int sizeInDays() {
		return (int) ChronoUnit.DAYS.between(from, to);
	}
	
	public boolean includesDate(LocalDate other) {
		return (other.isEqual(from) || other.isAfter(from)) && 
				(other.isEqual(to) || other.isAfter(to));
	}
	
	public boolean overlapse(DateLapse periodo) {
		return !this.to.isBefore(periodo.from) || this.from.isAfter(periodo.to);
		/*si this.to termina antes que empieze el otro -> no se solapan*/
		/*si this.from empieza despues de que termine el otro -> no se solapan*/
	}
}
