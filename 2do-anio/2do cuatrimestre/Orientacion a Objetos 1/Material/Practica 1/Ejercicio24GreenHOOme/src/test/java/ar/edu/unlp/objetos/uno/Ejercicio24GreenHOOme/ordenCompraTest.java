package ar.edu.unlp.objetos.uno.Ejercicio24GreenHOOme;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ordenCompraTest {
	/*variables que se necesitan*/
	private Producto p1;
	private Producto p2;
	private OrdenCompra orden;

	@BeforeEach
	/*se instancian las variables*/
	void setUp() throws Exception {
		p1 = new Producto("Panel solar","reciclable",35000,false);
		p2 = new Producto("compostera", "biodegradable", 8000, true);
		orden = new OrdenCompra(LocalDate.of(2025, 12, 7), "Larrea 5800, Mar del Plata",0);
	}

	@Test
	void testCostoInicialEsCero() {
		assertEquals(0,orden.calcularCosto());
	}
	
	@Test
	void testConDosProductos() {
		orden.agregarProducto(p1);
		orden.agregarProducto(p2);
		
		assertEquals(43000,orden.calcularCosto());
	}
	
	@Test
	void testSinAplicarDescuento() {
		for (int i=0; i < 4 ; i++) {
			orden.agregarProducto(p2);
		}
		
		assertEquals(4 * 8000,orden.calcularCosto());
	}
	
	@Test
	void testAplicandoDescuento() {
		for(int i=0;i < 5; i++) {
			orden.agregarProducto(p2);
		}/*agrego 5 de 8000 para hacer 40000*/
		
		double bruto = 5 * 8000; /*espero los 40000*/
		double esperado = bruto * 0.9;/*este seria el total*/
		
		assertEquals(esperado, orden.calcularCosto());
	}

}
