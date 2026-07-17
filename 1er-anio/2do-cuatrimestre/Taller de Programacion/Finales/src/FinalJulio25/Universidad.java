package FinalJulio25;
import java.util.*;
public class Universidad {
	private Alumnos [] alumnos;
	private int cantAlumnos;
	
	public Universidad(int cantidadAlumnos) {
		this.alumnos = new Alumnos[cantidadAlumnos];

		this.cantAlumnos = 0;
	}
	
	public int getCantidadAlumnos() {
		return this.cantAlumnos;
	}
	/*A*/
	public void agregarAlumno(Alumnos alu) {
		alumnos[this.getCantidadAlumnos()] = alu;
		this.cantAlumnos++;
	}
	
	
	/*B*/
	public void agregarExamen(String legajo, Examen exm) {
		int i = 0;
		boolean encontre = false;
		while (i < cantAlumnos && !encontre) {
			if (alumnos[i].getLegajo().equals(legajo)) {
				alumnos[i].agregarExm(exm);
				encontre = true;
			}
			i+= 1;
		}
	}
	
	
	/*C*/
	public int cantidadDeExamenes(int mes, int anio,String modalidad) {
		int cantidad = 0;
		for (int i = 0; i < cantAlumnos; i++) {
			cantidad += alumnos[i].contarCantidad(mes, anio, modalidad);
		}
		return cantidad;
	}
	
	public Alumnos devolverAlumnoMejorPromedio() {
		double promMax = -1;
		Alumnos alumnoMax = null;
		
		for (int i = 0; i < cantAlumnos; i ++) {
			if (alumnos[i].devolverPromedioDelAlumno() > promMax) {
				promMax = alumnos[i].devolverPromedioDelAlumno();
				alumnoMax = alumnos[i];
			}
		}
		return alumnoMax;
		
	}
	public static void main(String[] args) {

	    Scanner teclado = new Scanner(System.in);

	    // Universidad para 1000 alumnos
	    Universidad uni = new Universidad(1000);

	    // Dos alumnos (máximo 10 exámenes)
	    Alumnos a1 = new Alumnos("German", "Rodriguez", "100", 10);
	    Alumnos a2 = new Alumnos("Camila", "Perez", "101", 10);

	    uni.agregarAlumno(a1);
	    uni.agregarAlumno(a2);

	    // Dos exámenes para cada alumno
	    uni.agregarExamen("100", new Examen(7, 2025, 8, "Escrito"));
	    uni.agregarExamen("100", new Examen(7, 2025, 9, "Oral"));

	    uni.agregarExamen("101", new Examen(7, 2025, 6, "Escrito"));
	    uni.agregarExamen("101", new Examen(8, 2025, 10, "Trabajo Integrador"));

	    // Datos ingresados por teclado
	    System.out.print("Ingrese mes: ");
	    int mes = teclado.nextInt();

	    System.out.print("Ingrese año: ");
	    int anio = teclado.nextInt();
	    teclado.nextLine();

	    System.out.print("Ingrese modalidad: ");
	    String modalidad = teclado.nextLine();

	    // Inciso C
	    int cantidad = uni.cantidadDeExamenes(mes, anio, modalidad);

	    System.out.println("Cantidad de examenes encontrados: " + cantidad);

	    // Inciso D
	    Alumnos mejor = uni.devolverAlumnoMejorPromedio();

	    System.out.println("Alumno con mejor promedio:");
	    System.out.println(mejor.getNombreApellido());

	    teclado.close();
	}
	
	
}
