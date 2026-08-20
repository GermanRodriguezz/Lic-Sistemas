package ar.edu.unlp.info.oo1.Ejercicio11_CuentaBancaria;

public class CuentaCorriente extends Cuenta{
	private double limite;
	
	
	
	public CuentaCorriente() {
		super();
		this.limite = 0;
	}
	
	public void setLimite(double li) {
		this.limite = li;
	}
	
	public double getLimite() {
		return this.limite;
	}
	
	public boolean puedeExtraer(double monto) {
		/*para extraer necesito saber cuanto saldo tiene en su cuenta
		 y el limite permitido, para que ? si hacemos montoDisponible + limite
		 nos dara el total que puede extraer y si eso > montoAExtraer  : podra realizar la extraccion*/
		double montoDisponible  = this.getSaldo() + this.limite;
		if (montoDisponible >= monto) {
			return true;
		}
		return false;
	}
	
	
}
