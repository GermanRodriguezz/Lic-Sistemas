package FinalJulio25;

public class Alumnos {
	private String nombre;
	private String apellido;
	private String nLegajo;
	private Examen [] examenes;
	private int cantExamenes;

	
	public Alumnos() {
		
	}
	
	public Alumnos(String nom, String ape, String lega,int cantidadExamen) {
		this.nombre = nom;
		this.apellido = ape;
		this.nLegajo = lega;
		this.cantExamenes = 0;
		this.examenes = new Examen[cantidadExamen];
		
	}
	
	public String getNombreApellido() {
		return this.nombre + this.apellido;
	}
	
	public String getLegajo() {
		return this.nLegajo;
	}
	
	public Examen[] getExamenes() {
		return this.examenes;
	}
	
	public int getCantidadExamenes() {
		return this.cantExamenes;
	}
	
	public void agregarExm(Examen exm) {
		examenes[this.getCantidadExamenes()] = exm;
		this.cantExamenes++;
	}
	
	/*C*/
	public int contarCantidad(int mes, int anio, String modalidad) {
		int cantidad = 0;
		for (int i = 0; i < cantExamenes; i ++) {
			if (examenes[i].getMes() == mes && examenes[i].getAnio() == anio && examenes[i].getModalidad().equals(modalidad)) {
				cantidad+= 1;
			}
		}
		return cantidad;
	}
	/*D*/
	public double devolverPromedioDelAlumno() {
		int calificaciones = 0;
		for (int i = 0; i < cantExamenes; i++) {
			calificaciones += examenes[i].getCalificacion();
		}
		return (double) calificaciones / cantExamenes;
	}
	
	
	
}
