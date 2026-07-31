package FinalMarzo2023;

public class PartidoDoble extends Partidos{
	private Tenista j1;
	private Tenista j2;
	private Tenista j3;
	private Tenista j4;
	
	public PartidoDoble(String fecha,String lugar,Tenista j1,Tenista j2,Tenista j3,Tenista j4) {
		super(fecha,lugar);
		this.j1 = j1;
		this.j2 = j2;
		this.j3 = j3;
		this.j4 = j4;
	}
	
	public void otorgarPremio(double premio) {
		if (this.finalizoElPartido()) {
			if (getContador1() > getContador2()) {
				
				double premio_jugador1 = premio * (j1.getPartidosGanados() / (j1.getPartidosGanados() + j2.getPartidosGanados()));
				j1.ganePartido(premio_jugador1);
				
				
				double premio_jugador2 = premio * (j2.getPartidosGanados() / (j2.getPartidosGanados() + j1.getPartidosGanados()));
				j2.ganePartido(premio_jugador2);
			}
			else {
				double premio_jugador3 = premio * (j3.getPartidosGanados() / (j3.getPartidosGanados() + j4.getPartidosGanados()));
				j3.ganePartido(premio_jugador3);
				
				double premio_jugador4 = premio * (j4.getPartidosGanados() / (j4.getPartidosGanados() + j3.getPartidosGanados()));
				j4.ganePartido(premio_jugador4);
			}
			
		}
			
	}
}
