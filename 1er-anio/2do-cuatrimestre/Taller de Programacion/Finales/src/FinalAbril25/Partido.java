package FinalAbril25;

public class Partido {
	private String equipoLocal;
	private String equipoVisitante;
	private String resultado;
	private double pagoVicLocal;
	private double pagoVicVisitante;
	private double pagoEmpate;

	
	public Partido() {
		
	}
	
	public Partido(String eql,String eqv, double pagoloc,double pagovis,double pagoem) {
		this.equipoLocal = eql;
		this.equipoVisitante = eqv;
		this.resultado = "";
		this.pagoVicLocal = pagoloc;
		this.pagoVicVisitante = pagovis;
		this.pagoEmpate = pagoem;
	}
	
	public void setResultado(String res) {
		this.resultado = res;
	}
	
	public String getResultado() {
		return this.resultado;
	}
	
	public double getPagoVicLocal() {
		return this.pagoVicLocal;
	}
	
	public double getPagoVicVisitante() {
		return this.pagoVicVisitante;
	}
	
	public double getPagoEmpate() {
		return this.pagoEmpate;
	}
	
	public String getNombreEquipoLocal() {
		return this.equipoLocal;
	}
	
	public String getNombreEquipoVisitante() {
		return this.equipoVisitante;
	}
	
}
