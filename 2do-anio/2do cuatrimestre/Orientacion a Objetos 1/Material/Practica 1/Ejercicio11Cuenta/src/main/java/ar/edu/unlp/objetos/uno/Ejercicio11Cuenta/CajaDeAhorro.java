package ar.edu.unlp.objetos.uno.Ejercicio11Cuenta;

public class CajaDeAhorro extends Cuenta {
	
	public CajaDeAhorro() {
		super();
	}
	
	protected void extraerSinControl(double monto) {
		double costo = monto * 0.2;
		super.extraerSinControlar(monto+costo);
	}
	
	public boolean puedeExtraer(double monto) { /*si pido 100, extrae 100 pero tiene que tener el costo de 100 + 0.2%*/
		double costo = monto * 0.2;
		if (this.getSaldo() >= (monto + costo)){
			return true;
		}
		return false;
	}
	
	public void depositar(double monto) {
		double costo = monto * 0.2;
		super.depositar(monto-costo);
	}
	
}

