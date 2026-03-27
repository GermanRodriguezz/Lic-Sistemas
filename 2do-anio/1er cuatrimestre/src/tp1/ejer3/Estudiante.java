package tp1.ejer3;

public class Estudiante {
	private String nombre;
	private String apellido;
	private int comision;
	private String email;
	private String dire;
	
	public Estudiante (String nom, String ap, int comision, String email, String dire) {
		this.nombre = nom;
		this.apellido = ap;
		this.comision = comision;
		this.email = email;
		this.dire = dire;
	}
	
	public Estudiante() {
		
	}

	public String getNombre() {
		return nombre;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDire() {
		return dire;
	}

	public void setDire(String dire) {
		this.dire = dire;
	}
	public String tusDatos() {
		return  "Mi nombre es : " + getNombre() + " , Apellido: " + getApellido()+ ", Comision: " + getComision() + ", Email: "+ getEmail() + ", Direccion: " + getDire();
	}
	
}
