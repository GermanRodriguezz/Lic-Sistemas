package ar.edu.unlp.info.oo1.Ejercicio11_CuentaBancaria;

public abstract class Cuenta {
	private double saldo;
	
	public Cuenta() {
		saldo = 0;
	}
	
	public double getSaldo() {
		return this.saldo;
	}
	
	public void depositar(double monto) {
		this.saldo += monto;
	}
	
	protected void extraerSinControlar(double monto) {
		this.saldo -= monto;
	}
	
	public boolean extraer(double monto) {
		if (this.puedeExtraer(monto)) {
			this.extraerSinControlar(monto);
			return true;
		}
		return false;
	}
	
	protected abstract boolean puedeExtraer(double monto);
	
	public boolean transferirACuenta(double monto,Cuenta cuentaDest) {
		if (this.puedeExtraer(monto)) {
			this.extraerSinControlar(monto);
			cuentaDest.depositar(monto);
			return true;
		}
		return false;
	}
}
