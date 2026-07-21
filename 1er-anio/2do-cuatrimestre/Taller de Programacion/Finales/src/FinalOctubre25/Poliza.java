package FinalOctubre25;

public class Poliza {
	private double montoAsegurado;
	private double cuotaMensual;
	private boolean vigente;
	private int fechaComienzo;
	private int fechaCobertura;
	private Persona cliente;
	
	public Poliza() {}
	
	public Poliza(double mon,double cuota,boolean vig,int fc, int ff,Persona cli) {
		this.montoAsegurado = mon;
		this.cuotaMensual = cuota;
		this.vigente = vig;
		this.fechaComienzo = fc;
		this.fechaCobertura = ff;
		this.cliente = cli;
	}
	
	public String getInformacion() {
		return "Cliente " + cliente.toString() + "Monto Asegurado" +  this.montoAsegurado + " etc..";
	}
	
	public int getDni() {
		return this.cliente.getDNI();
	}
	
	public double getCuotaMensual() {
		return this.cuotaMensual;
	}
	
	public void setCuotaMensual(double monto) {
		this.cuotaMensual = monto;
	}
	
	public boolean getVigente() {
		return this.vigente;
	}
	
	public void aumentarCuota(double aumento) {
		this.cuotaMensual *= aumento;
	}
	
}
