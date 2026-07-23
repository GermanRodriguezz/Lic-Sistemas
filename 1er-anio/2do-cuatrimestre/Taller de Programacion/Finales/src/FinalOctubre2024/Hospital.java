package FinalOctubre2024;
import java.util.Scanner;
public class Hospital {
	private String nombre;
	private int direccion;
	private Cama [][] pisos;
	
	
	public Hospital(String nom, int dire) {
		this.nombre = nom;
		this.direccion = dire;
		
		pisos = new Cama[10][20];
		int id = 1;
		for (int i = 0; i < 10; i++) {
			for (int j = 0 ; j < 20;j++) {
				pisos[i][j] = new Cama(id);
				id++;
			}
		}
	}
	/*A*/
	public void agregarPaciente(Paciente p, int piso, int numcama) {

		pisos[piso-1][numcama-1].agregarPaciente(p);
	}
	
	/*B*/
	public void DarDeAltaCamaDNI(int dni) {
		int fila = 0;
		int columna;
		boolean libero = false;
		while (fila < 10 && !libero) {
			columna = 0;
			while (columna < 20 && !libero) {
				if (pisos[fila][columna].getDniPaciente() == dni) {
					pisos[fila][columna].liberarCama();
					libero = true;
					System.out.println("Se libero la cama del paciente con dni : " + dni);
				}
				columna++;
			}
			fila++;
		}
	}
	/*C*/
	public void incrementarCantidad() {
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j <20; j++) {
				if (pisos[i][j].getOcupada()) {
					pisos[i][j].incrementarDias();
				}
			}
				
		}
	}
	
	/*D*/
	public int cantidadDePisosLlenos() {
		int cantidadLleno = 0;
		
		for (int i = 0; i < 10; i++) {
			int cantidadDelPiso = 0;
			for (int j = 0; j < 20; j++) {
				if (pisos[i][j].getOcupada() == true) {
					cantidadDelPiso++;
				}
			}
			if (cantidadDelPiso == 20) {
				cantidadLleno++;
			}
		}
		return cantidadLleno;
	}
	
	public static void main(String[] args) {
		Hospital hos = new Hospital("Italiano", 150);
		
		/*cinco pacientes*/
		Paciente p1 = new Paciente(45,"german","ioma");
		Paciente p2 = new Paciente(44,"valentina","primedic");
		Paciente p3 = new Paciente(42,"camila","ioma");
		Paciente p4 = new Paciente(41,"ariana","ioma");
		Paciente p5 = new Paciente(40,"federico","ioma");
		
		/*agregar los pacientes*/
		
		hos.agregarPaciente(p1, 1, 1);
		hos.agregarPaciente(p2, 1, 2);
		hos.agregarPaciente(p3, 2, 1);
		hos.agregarPaciente(p4, 3, 5);
		hos.agregarPaciente(p5, 5, 10);
		
		/*incrementar los dias*/
		hos.incrementarCantidad();
		
		/*imprimir los pisos llenos*/
		System.out.print("Cantidad de pisos llenos" + hos.cantidadDePisosLlenos());
		
		Scanner teclado = new Scanner(System.in);
		
		System.out.print("Ingrese DNI del paciente a dar de alta: ");
	    int dni = teclado.nextInt();

	    hos.DarDeAltaCamaDNI(dni);
	}
	
	
	
}
