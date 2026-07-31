package FinalMarzo2023;

public class Tenista {
	private String nom;
	private int partidosG;
	private double premios;
	
	public Tenista(String nombre) {
		this.nom = nombre;
		this.partidosG = 0;
		this.premios = 0;
	}
	
	public int getPartidosGanados() {
		return this.partidosG;
	}
	
	public void ganePartido(double pre) {
		this.partidosG++;
		this.premios += pre;
	}
	
}
