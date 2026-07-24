package FinalSeptiembre2024;

public abstract class Cuenta {
	private int numeroCuenta;
	private int dniCliente;
	private double saldo;
	private boolean estado;
	private double [] movimientos;
	private int dimMovimientos;
	
	
	public Cuenta(int numcue, int dni) {
		this.numeroCuenta = numcue;
		this.dniCliente = dni;
		this.saldo = 0;
		this.estado = true;
		this.movimientos = new double [20];
	}
	
	public Cuenta() {
		
	}
	
	public double getSaldo() {
		return this.saldo;
	}
	
	public void cancelarCuenta() {
		this.estado = false;
	}
	
	public void depositar(double unMonto) {
		this.saldo += unMonto;
		this.movimientos[dimMovimientos] = unMonto;
		dimMovimientos++;
	}
	
	public abstract boolean esPosibleExtraer(double unMonto);
	
	public boolean extraer(double unMonto) {
		if (this.esPosibleExtraer(unMonto)){
			this.saldo-= unMonto;
			movimientos[dimMovimientos] = -unMonto;
			dimMovimientos++;
			return true;
		}
		return false;
	}
	
	public abstract void cobrarMantenimiento();
	
	public String toString(){
		String resultado = "";
		
		/*numero de cuenta*/
		resultado += "Numero de cuenta " + this.numeroCuenta + "\n";
		
		/*dni del cliente*/
		resultado += "Dni del cliente " + this.dniCliente + "\n";
		
		/*ultimos moviemientos*/
		resultado += "Movimientos : " + "\n"; 
		for (int i = 0; i < dimMovimientos; i++) {
			resultado += movimientos[i] + " - ";
		}
		
		/*estado de la cuenta*/
		resultado += "Estado : " + this.estado + "\n";
		
		/*saldo dispo*/
		resultado += "Saldo disponible : " + this.saldo + "\n";
		
		return resultado;
	}
	
	
}
