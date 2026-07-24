package FinalSeptiembre2024;

public class CajaDeAhorro extends Cuenta{
	private int numeroTarjetaCredito = 0;
	
	public CajaDeAhorro(int num, int numcuenta,int dni) {
		super(numcuenta,dni);
		this.numeroTarjetaCredito = num;
	}
	
	public int getNumeroTarjeta() {
		return this.numeroTarjetaCredito;
	}
	
	public void realizarDeposito(double unMonto) {
		this.depositar(unMonto);
	}
	
	public boolean esPosibleExtraer(double unMonto) {
		return this.getSaldo() > unMonto;
	}
	
	public boolean extraerDinero(double unMonto) {
		return this.extraer(unMonto);
	}
	
	public void cobrarMantenimiento() {
		double base = 0;
		if (this.getNumeroTarjeta() != 0) {
			base = 2000 + (1 / (this.getSaldo()+1));
		}
		else {
			base = 1000 + (1 / (this.getSaldo()+1));
		}
		if (this.esPosibleExtraer(base))
			this.extraer(base);
		else {
			this.cancelarCuenta();
		}
	}
	
	public String resumen() {
		String resultado = "";
		
		if (this.getNumeroTarjeta() != 0) {
			resultado += this.toString() + "El numero de tajera asociada es : " + this.getNumeroTarjeta();
		}
		else {
			resultado += this.toString() + "No posee numero de tarjeta asociada";
		}
		return resultado;
	}
	
}
