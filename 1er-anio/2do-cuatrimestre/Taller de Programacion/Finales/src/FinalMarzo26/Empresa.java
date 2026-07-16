package FinalMarzo26;
import java.util.Scanner;
public class Empresa {
	private String nameEmpresa;
	private int direccion;
	private Oficina [] [] oficinas;
	
	public Empresa(String name,int dir) {
		this.nameEmpresa = name;
		this.direccion = dir;
		
		this.oficinas = new Oficina [3] [10]; /*0, 1, 2 - 0,.., 9 (hay 10)*/
		for (int i = 0; i<3; i++) {
			for (int j= 0; j<10;j++) {
				oficinas[i][j] = new Oficina();
			}
		}
		
		
	}
	/*A*/
	public void realizarAlquiler(Persona inquilino, double mont,int piso,int numofi) {
		if (oficinas[piso-1][numofi-1].getInquilino() == null) {
			oficinas[piso-1][numofi-1].setInquilino(inquilino);
			oficinas[piso-1][numofi-1].setCosto(mont);
		}
	}
	
	/*B*/

	
	public void liberarOficina(int dni, boolean dejar) {
		int fila = -1;
		int columna = -1;
		
		int i = 0;
		int j;
		boolean encontre = false;
		while (i < 3 && !encontre) {
			j = 0;
			while (j < 10 && !encontre) {
				if (oficinas[i][j].getInquilino() != null && oficinas[i][j].getInquilino().getDni() == dni) {
					encontre = true;
					fila = i;
					columna = j;
				}
				j++;
			}
			i++;
		}
		if (encontre) {
			System.out.print("SE LIBERO LA OFICINA DEL DNI "+ dni);
		}
		else {
			System.out.print(" NO SE ENCONTRO LA OFICINA DEL DNI "+ dni);
		}
		if (fila != -1 && columna != -1) {
			oficinas[fila][columna].setCosto(0);
			oficinas[fila][columna].setInquilino(null);
			oficinas[fila][columna].setAmueblada(dejar);
			}
	}
	
	/*C*/
	public void IncrementarMonto() {
		double incremento = 0.05;
		for (int i= 0; i < 3 ; i++) {
			for(int j = 0;j < 10; j++) {
				if (oficinas[i][j].getInquilino() != null) {
					oficinas[i][j].setCosto(oficinas[i][j].getCostoDiario() + (oficinas[i][j].getCostoDiario() * (incremento)));
				}
			}
			incremento += 0.05;
		}
		
	}
	
	/*D*/
	public int cantidadAlquiladas(int piso) {
		int cant =0;
		if (piso >= 1 && piso <= 3) {
			for (int j =0;j < 10; j++) {
				if (oficinas[piso-1][j].getInquilino() != null /*&& oficinas[piso-1][j].getAmueblada()*/) {
					cant++;
				}
			}
		}
		return cant;
	}
	
	public static void main (String[] args) {
		
		Empresa empre = new Empresa("ypf",1055);
		
		Persona inqui1 = new Persona("Gaston Rdz", 41);
		Persona inqui2 = new Persona("Camila Rdz",44);
		Persona inqui3 = new Persona("Ariana Rdz",42);
		Persona inqui4 = new Persona("German Rdz",45);
		
		empre.realizarAlquiler(inqui1, 10, 1, 5);
		
		empre.realizarAlquiler(inqui2, 20, 2, 5);
		
		empre.realizarAlquiler(inqui3, 30, 3, 5);
		
		empre.realizarAlquiler(inqui4, 40, 3, 6);
		
		empre.oficinas[2][3].setAmueblada(true);
		empre.oficinas[2][5].setAmueblada(true);
		
		empre.IncrementarMonto();
		
		System.out.print("La cantidad de oficinas alquiladas en el piso son de : ");
		System.out.println(empre.cantidadAlquiladas(3));
		
		Scanner teclado = new Scanner(System.in);
		
		System.out.println("Ingrese el DNI :");
		int dni = teclado.nextInt();
		empre.liberarOficina(dni, false);
	}
}
