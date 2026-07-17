package FinalJulio25;

public class Examen {
	private int mes;
	private int anio;
	private int calificacion;
	private String modalidad;
	
	public Examen(int m, int a, int cali,String moda) {
		this.mes = m;
		this.anio = a;
		this.calificacion = cali;
		this.modalidad = moda;
	}
	
	public Examen() {
		
	}
	
	public int getMes() {
		return this.mes;
	}
	
	public int getAnio() {
		return this.anio;
	}
	
	public int getCalificacion() {
		return this.calificacion;
	}
	
	public String getModalidad() {
		return this.modalidad;
	}
	
}
