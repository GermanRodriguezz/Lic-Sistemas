package FinalJulio25;

public class Universidad {
	private Alumnos [] alumnos;
	private int cantAlumnos;
	
	public Universidad(int cantidadAlumnos) {
		this.alumnos = new Alumnos[cantidadAlumnos];
		
		for (int i = 0;i < cantidadAlumnos; i++) {
			alumnos[i] = new Alumnos();
		}
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
	public void agregarExamen(String legajo) {
		int i = 0;
		boolean encontre = false;
		while (i < cantAlumnos && !encontre) {
			if (alumnos[i].getLegajo().equals(legajo)) {
				Examen exm = new Examen(7, 2025, 6, "Escrito");
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
	
	
}
