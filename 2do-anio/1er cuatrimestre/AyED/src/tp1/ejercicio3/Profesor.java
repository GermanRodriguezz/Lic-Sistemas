package tp1.ejercicio3;

public class Profesor {
	private String nombre;
	private String apellido;
	private int comision;
	private String catedra;
	private String facultad;
	private String email;
	
	public Profesor(String nom, String ap, int comision, String catedra, String facu, String email) {
		this.nombre = nom;
		this.apellido = ap;
		this.comision = comision;
		this.catedra = catedra;
		this.facultad = facu;
		this.email = email;
		
}

	public Profesor() {
		
	}

	public String getNombre() {
		return nombre;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	


	public int getComision() {
		return comision;
	}


	public void setComision(int comision) {
		this.comision = comision;
	}


	public String getCatedra() {
		return catedra;
	}


	public void setCatedra(String catedra) {
		this.catedra = catedra;
	}


	public String getFacultad() {
		return facultad;
	}


	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	public String tusDatos() {
		return  "Mi nombre es : " + getNombre() + " , Apellido: " + getApellido()+ ", Email: "+ getEmail() + ", Direccion: " + getFacultad()+ ", Catedra: "+ getCatedra();
	}
	
}

