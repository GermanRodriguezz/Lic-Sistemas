package tp5.grafos.src.tp5.ejercicio5;

public abstract class Persona {
	private String name;
	private String domicilio;
	
	public Persona(String n, String d) {
		this.name = n;
		this.domicilio = d;
	}
	
	public abstract boolean getCobro();
	
}
