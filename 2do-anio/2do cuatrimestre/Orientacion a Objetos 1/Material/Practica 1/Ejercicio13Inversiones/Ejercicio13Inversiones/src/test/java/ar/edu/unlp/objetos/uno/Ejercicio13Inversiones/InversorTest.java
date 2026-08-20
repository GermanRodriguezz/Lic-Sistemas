package ar.edu.unlp.objetos.uno.Ejercicio13Inversiones;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.time.LocalDate;
public class InversorTest {
	
	private Inversor inversor;
	private InversionEnAccion accion;
	private PlazoFijo pfijo;
		
	@BeforeEach
	void setUp() throws Exception {
		inversor = new Inversor("German");
		accion = new InversionEnAccion("Criptomoneda",10,100);
		pfijo = new PlazoFijo(LocalDate.of(2025,10,28),100, 5);
	}

	@Test
	void testInversionEnAccion() {
		assertEquals(1000, accion.ValorActual());
	}
	@Test
	void testPlazoFijo() {
		assertEquals(5100, pfijo.ValorActual());
	}
	
	@Test
	void testInversion(){
		assertEquals(0, inversor.ValorTotal());
		inversor.agregarInversion(accion);
		inversor.agregarInversion(pfijo);
		assertEquals(6100, inversor.ValorTotal());
	}

}
