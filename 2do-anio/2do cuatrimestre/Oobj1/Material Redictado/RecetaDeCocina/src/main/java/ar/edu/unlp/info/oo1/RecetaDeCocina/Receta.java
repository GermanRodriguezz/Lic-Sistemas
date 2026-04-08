package ar.edu.unlp.info.oo1.RecetaDeCocina;

import java.util.List;

public class Receta {
	private String name;
	private List<Alimento> ingredientes; 
	
	public String Descripcion() {
		String cadena = "";
		for (Alimento i : ingredientes) {
			cadena += i.obtenerDescrip() + "\n";
		}
		return cadena;
	}
		
		public Double costoTotal() {
			double total = 0.0;
			for (Alimento i : ingredientes) 
				total += i.costo();
			return total;
		}
	}


/*CASOS DE PRUEBA
 * DEBEMOS TESTEAR LOS METODOS
 * OBTENER DESCRIPCION DE LA CLASE RECETA
 * COSTOTOTAL
 * 
 * OBTENER DESCRIPCION
 * 	TENEMOS QUE TESTEAR : VALORES DE BORDE :
 * 							QUE TENGA O NO ITEMS -> PUEDE LLEGAR A QUERER OBTENER UNA CADENA VACIA
 * 							QUE TENGA LOS ITEMS -> QUE DEVUELVA LOS 3 ITEMS BASE, CONDIMENTO Y PROTEINA
 * 							SI NOSOTROS DECLARAMOS LA RECETA 
 * 								ARROZ INTEGRAL 1PORCION
 * 								PIMIENTA PICANTE 3
 * 								POLLO EN CUBO 15 CUBOS 500P
 * 							DEBEMOS OBTENER QUE LA BASE ES ARROZ , INTEGRAL , 1
 * 							DEBEMOS OBTENER QUE CONDIMENTO PIMIENTA PICANTE 3
 * 							DEBEMOS OBTENER QUE PROTEINA DE POLLO EN CUBO 3 PORCIONES A 500 
 * 							
 * 							
 * COSTO TOTAL :
 * TENEMOS QUE TESTEAR : PARTICIONES EQUIVALENTES
 * 						EL METODO OBTENER DESCRIP
 * 						SI TIENE  (BASE, CONDIMENTO, PROTEINA)
 * 						EL METODO ME TIENE QUE DEVOLVER LOS ATRIBUTOS CORRESPONDIENTES A CADA TIPO SIENDO TIPO (BASE, CONDIMENTO O PROTEINA)
 * 						PARA BASE DEBERIA EVALUAR SI : SI ES INTEGRAL O TRADICIONAL
 * 						PARA CONDIMENTOS DEBERIA EVALUAR SI : ES PICANTE O NO ES PICANTE
 * 						VALORES DE BORDE :
 * 						
 * 
 * 
 * 
 * 
 * */
