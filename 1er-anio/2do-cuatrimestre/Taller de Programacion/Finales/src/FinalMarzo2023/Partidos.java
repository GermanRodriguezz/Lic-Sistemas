package FinalMarzo2023;

public abstract class Partidos {
	private String fecha;
	private String lugarDeJuego;
	private int contador1;
	private int contador2; 
	
	
	public Partidos () {
		
	}
	
	public Partidos (String f, String lu) {
		this.fecha = f;
		this.lugarDeJuego = lu;
		this.contador1 = 0;
		this.contador2 = 0;
	}
	
	public void registrarResultadoSet(int points1, int points2) {
		if (points1 > points2 ) {
			this.contador1++;
		}
		else
			this.contador2++;
	}
	
	public int getContador1() {
		return this.contador1;
	}
	
	public int getContador2() {
		return this.contador2;
	}
	
	public boolean finalizoElPartido() {
		
		return (this.getContador1() == 3 || this.contador2 == 3 );
	}
	
	public abstract void otorgarPremio(double premio);
	
}
