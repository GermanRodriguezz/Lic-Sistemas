package FinalSeptiembre24;

public class CajaAhorro extends Cuenta{
	private int numTarjeta;
	
	public CajaAhorro(int num, int dni, double sal, boolean es) {
		super(num,dni);
		this.numTarjeta = 0;
	}
	
	public void setNumeroTarjeta(int n) {
		this.numTarjeta = n;
	}
	
	public int getNumTarjeta() {
		return this.numTarjeta;
	}
	
	public boolean esPosibleExtraer(double unMonto) {
		return this.getSaldo() > unMonto;
	}
	
	public boolean extraerEnCaja(double unMonto) {
		return this.extraer(unMonto);
	}
	
	public void cobrarMantenimiento() {
		double base;
		if (this.getNumTarjeta() != 0)
			base = 2000;
		else {
			base = 1000;
		}
		double costoMantenimiento = base + (1 / this.getSaldo()+1);
		if (!this.extraer(costoMantenimiento)) {
			this.setEstado(false);
		}
	}
}
