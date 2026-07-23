package FinalOctubre2024;

public class Paciente {
	private int dni;
	private String nombre;
	private String obraSocial;
	
	public Paciente(int dni,String nom,String obra) {
		this.dni = dni;
		this.nombre = nom;
		this.obraSocial = obra;
	}
	
	public int getDni() {
		return this.dni;
	}
	
}
