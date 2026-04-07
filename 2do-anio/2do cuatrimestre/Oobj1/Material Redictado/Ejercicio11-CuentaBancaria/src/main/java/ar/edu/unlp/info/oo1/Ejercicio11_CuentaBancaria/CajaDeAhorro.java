package ar.edu.unlp.info.oo1.Ejercicio11_CuentaBancaria;

public class CajaDeAhorro extends Cuenta{
	
	public CajaDeAhorro() {	
		super();
	}
	
	public void depositar(double monto) {
		super.depositar(monto);
	}
	
	protected boolean puedeExtraer(double monto) {
		double costo = monto * 0.02;
		double totalExtraccion = monto + costo;
		if (totalExtraccion <= this.getSaldo()) {
			return true;
		}
		return false;
	}
	
	public void extraerSinControlar(double monto) {
		super.extraerSinControlar(monto + (monto * 0.02));
	}
	
	public boolean transferirACuenta(double monto,Cuenta cd) {
		return super.transferirACuenta(monto, cd);
	}
}

