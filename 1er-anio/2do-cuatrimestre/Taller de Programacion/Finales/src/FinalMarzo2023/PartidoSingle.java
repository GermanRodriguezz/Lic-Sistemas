package FinalMarzo2023;

public class PartidoSingle extends Partidos{
	private Tenista jugador1;
	private Tenista jugador2;
	
	public PartidoSingle() {
		
	}
	
	public PartidoSingle(String fecha, String lugar, Tenista j1, Tenista j2) {
		super(fecha,lugar);
		this.jugador1 = j1;
		this.jugador2 = j2;
	}
	
	public void otorgarPremio(double premio) {
		if (this.finalizoElPartido()) {
			if (this.getContador1() > this.getContador2()) {
				/*si finaliza el partido y gano el jugador 1*/
				this.jugador1.ganePartido(premio);
			}
			else {
				this.jugador2.ganePartido(premio);
			}
		}
	}
}
