package FinalSeptiembre24;

public class CuentaCorriente extends Cuenta{
	private double acuerdo;
	
	public CuentaCorriente(double ac,int num, int dni, double sal, boolean est) {
		super(num,dni);
		this.acuerdo = ac;
	}
	
	public double getAcuerdo() {
		return this.acuerdo;
	}
	
	public boolean esPosibleExtraer(double unMonto) {
		return (this.getSaldo() + this.getAcuerdo()) > unMonto;
	}
	
	public boolean extraerEnCuentaCorriente(double unMonto) {
		return this.extraer(unMonto);
	}
	
	public void cobrarMantenimiento() {
		double base = 50 * acuerdo;
		if (this.extraer(base)) {
			this.setEstado(false);
		}
	}
}
