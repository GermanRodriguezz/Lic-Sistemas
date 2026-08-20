package ar.edu.unlp.objetos.uno.Ejercicio16Intervalo;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.time.LocalDate;

class DateLapseTest {
	private LocalDate inicio;
	private LocalDate fin;
	private DateLapse periodo;
	
	@BeforeEach
	void setUp() throws Exception {
		inicio = LocalDate.of(2025, 3, 10);
		fin = LocalDate.of(2025, 3, 20);
		periodo = new DateLapse(inicio,fin);
	}

	@Test /*test donde verifica si el total de dias declarados son 10*/
	public void testSizeInDay() {
		assertEquals(10, periodo.sizeInDays());
	}
	
	@Test /*test donde verifica si la fecha enviada se encuentra en medio de las fechas*/
	public void testIncludesDateMedio() {
		assertTrue(periodo.includesDate(LocalDate.of(2025, 3,15)));
	}
	
	@Test
	public void testIncludesDateIgualInicio() {
		assertTrue(periodo.includesDate(inicio));
	}
	
	public void testIncludesDateIgualFin() {
		assertTrue(periodo.includesDate(fin));
	}
	
	@Test
	public void testFechasIguales() {
		DateLapse rango = new DateLapse(inicio, inicio); /*esta instancia tiene como inicio y fin la misma fecha*/
		assertEquals(0, periodo.sizeInDays()); /*declaro si es igual el numero 0 a la respuesta del mensaje sizeInDay*/
		assertTrue(rango.includesDate(inicio));/*verdadero o falso se espera al preguntar si se encuentra dentro del rango*/
	}

}
