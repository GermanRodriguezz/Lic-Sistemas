package ar.edu.unlp.objetos.uno.Ejercicio11Cuenta;

public class CuentaCorriente extends Cuenta {
	private double descubierto;
	
	
	public CuentaCorriente() {
		super();
		descubierto = 0;
	}
	
	public double getDescubierto() {
		return descubierto;
	}
	
	public void setDescubierto(double desc) { /*este seteo es cuando negocian cliente/agente bancario cual sera su limite*/
		this.descubierto = desc;
	}
	
	public boolean puedeExtraer(double monto) {
		double total = this.descubierto + this.getSaldo();
		if (monto <= total) {
			return true;
		}
		return false;
	}
}