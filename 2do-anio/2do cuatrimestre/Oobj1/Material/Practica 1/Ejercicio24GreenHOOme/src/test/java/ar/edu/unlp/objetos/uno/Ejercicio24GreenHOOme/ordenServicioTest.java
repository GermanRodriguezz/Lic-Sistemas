package ar.edu.unlp.objetos.uno.Ejercicio24GreenHOOme;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/*LO QUE SE TESTEA ACA SON LOS CASOS DE BORDE DE EL HORARIO < 10*/

class ordenServicioTest {
	
	private Producto p1;
	private Tecnico tec1;
	private OrdenServicio orden;
	
	@BeforeEach
	void setUp() throws Exception {
		p1 = new Producto("Calefon Solar", "material reciclable", 50000, false);
		tec1 = new Tecnico("Lucia Iraola", "Instalaciones solares", 4500);
		orden = new OrdenServicio(LocalDate.of(2025, 12, 7), "Larrea 5800", "instalacion de calefon solar", 5);
	}

	@Test
	void testMenosDe10Horas() {
		orden.agregarProducto(p1);
		orden.agregarTec(tec1);
		
		assertEquals(72500,orden.calcularCosto());
	}
	
	@Test
	void testMasDe10Horas() {
		OrdenServicio os = new OrdenServicio(LocalDate.of(2025, 12, 7), "Larrea 5800","Instalacion de calefon solar", 11);
		
		os.agregarProducto(p1);
		os.agregarTec(tec1);
		
		double costoProd = 50000;
		double costoTecnico = 11 * 4500;
		double bruto = costoProd + costoTecnico;
		double esperado = bruto * 0.9;
		
		assertEquals(esperado, orden.calcularCosto());
	}
	

}
