package ar.edu.unlp.objetos.uno.Ejercicio19AlquilerDePropiedades;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TestUsuario {
	private Propiedad prop1;
	private Propiedad prop2;
	private Usuario inquilino;
	
	@BeforeEach
	void setUp() throws Exception {
		prop1 = new Propiedad("La Plata","Depto",100);
		prop2 = new Propiedad("Berisso" ,"Casa",200);
		inquilino = new Usuario("Ana","Calle 1",123);
	}

	@Test
	void testAgregarPropiedad() {
		inquilino.aggProp(prop1);
		inquilino.aggProp(prop2);
		assertEquals(2, inquilino.cantProp());
	}
	
	@Test
	void testCalcularIngresos() {
		inquilino.aggProp(prop1);
		inquilino.aggProp(prop2);
		prop1.crearReserva(new DateLapse(LocalDate.of(2025, 11, 1),LocalDate.of(2025, 11, 7)), 
				new Usuario("Usuario","Berisso2",789));
		prop2.crearReserva(new DateLapse(LocalDate.of(2025, 11, 1),LocalDate.of(2025, 11, 5)),
				new Usuario("Usuario2","Berisso2",012));
		assertEquals(1700, inquilino.calcularIngresos(new DateLapse(LocalDate.of(2025, 11, 1),LocalDate.of(2025,11,7))));
	}

}
