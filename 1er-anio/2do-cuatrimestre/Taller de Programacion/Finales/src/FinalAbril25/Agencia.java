package FinalAbril25;
import java.util.Scanner;
public class Agencia {
	private Partido [] partidos;
	private Apuestas [] apuestas;
	private int dimPartidos;
	private int dimApuestas;
	
	public Agencia() {
		this.apuestas =  new Apuestas[100];
		this.partidos = new Partido[20];
		this.dimPartidos = 0;
		this.dimApuestas = 0;
	}
	
	
	/*A*/
	public int agregarPartido(Partido p) {
		partidos[dimPartidos] = p;
		dimPartidos++;
		
		return dimPartidos;
	}
	/*B*/
	public void agregarApuesta(Apuestas ap) {
		apuestas[dimApuestas] = ap;
		dimApuestas++;
	}
	/*C*/
	public void agregarResultado(String res, int id) {
		if (id >= 1 && id <= dimPartidos) { /*aca podria preguntar por id <= dimPartidos*/
			partidos[id-1].setResultado(res);
		}
	}
	/*D*/
	public void cerrarApuesta() {
		for (int i = 0; i < dimApuestas; i++) {
			int ide = apuestas[i].getIdPartido();
			
			if (partidos[ide-1].getResultado().equals(apuestas[i].getApuestaPor())) {
				
				if (partidos[ide-1].getResultado().equals("Empate")) {
					System.out.print("El cliente " + apuestas[i].getNombre() + "DNI"+ apuestas[i].getDNI() + " el dinero ganado es: " + apuestas[i].getMontoApostado() * partidos[ide-1].getPagoEmpate());
				}
				else {
					if (partidos[ide-1].getResultado().equals("Victoria Local")) {
						System.out.print("El cliente " + apuestas[i].getNombre() + "DNI"+ apuestas[i].getDNI() + " el dinero ganado es : " + apuestas[i].getMontoApostado() * partidos[ide-1].getPagoVicLocal());
					}
					else
						System.out.print("El cliente " + apuestas[i].getNombre() + "DNI"+ apuestas[i].getDNI() + " el dinero ganado es : " + apuestas[i].getMontoApostado() * partidos[ide-1].getPagoVicVisitante());
				}
				
			}
			
		}
	}
	/*E*/
	public void limpiarSistema() {
	    this.partidos = new Partido[20];
	    this.apuestas = new Apuestas[100];

	    this.dimPartidos = 0;
	    this.dimApuestas = 0;
	}
	
}
