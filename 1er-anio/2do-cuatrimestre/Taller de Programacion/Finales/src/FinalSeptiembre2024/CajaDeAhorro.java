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
	
	public boolean esPosibleExtraer(double unMonto) {
		return this.getSaldo() > unMonto;
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
	
	public static void main (String [] args) {
		
		CajaDeAhorro cajaAhorro = new CajaDeAhorro(123456,1001,45872);
		CuentaCorriente cuentaCorriente = new CuentaCorriente(5000,2001,44872);
		
		cajaAhorro.depositar(10000);
		cuentaCorriente.depositar(20000);
		
		if (cajaAhorro.extraer(3000)) {
			System.out.println("Extraccion realizada en Caja de ahorro");
		}
		else {
			System.out.println("No se pudo realizar la extraccion en caja de ahorro");
		}
		
		if (cuentaCorriente.extraer(22000)) {
			System.out.println("Extraccion realizada en Cuenta corriente");
		}
		else {
			System.out.println("No se pudo realizar la extraccion en cuenta corriente");
		}
		
		
		System.out.println(" ----------Resumen de la caja de ahorro---------");
		System.out.println(cajaAhorro.resumen());
		
		System.out.println("-----------Resumen de la cuenta corriente-----------");
		System.out.println(cuentaCorriente.resumen());
		
	}
	
	
	
}
