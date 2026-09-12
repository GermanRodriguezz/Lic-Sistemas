package FinalSeptiembre24;

public abstract class Cuenta {
	private int numCuenta;
	private int dniCliente;
	private double saldo;
	private boolean estado;
	private double [] historial;
	private int cantMov;
	
	public Cuenta(int num, int dni) {
		this.numCuenta = num;
		this.dniCliente = dni;
		this.saldo = 0;
		this.estado = true;
		this.historial = new double [20];
		this.cantMov = 0;
	}
	
	public int getDni() {
		return this.dniCliente;
	}
	
	public int getNum() {
		return this.numCuenta;
	}
	
	public double getSaldo() {
		return this.saldo;
	}
	
	public boolean getEstado() {
		return this.estado;
	}
	
	public int getMovimiento() {
		return this.cantMov;
	}
	
	public void setEstado(boolean e) {
		this.estado = e;
	}
	
	public void depositar(double deposito) {
		this.saldo += deposito;
		/*en la posicion */
		if (this.getMovimiento() < 20) {
			this.historial[this.getMovimiento()] = deposito;
			this.cantMov++;
		}	
	}
	
	public boolean extraer(double unMonto) {
		boolean pudo = this.esPosibleExtraer(unMonto);
		if (pudo) {
			this.saldo -= unMonto;
			if (this.getMovimiento() < 20) {
				this.historial[this.getMovimiento()] = -unMonto;
				this.cantMov++;
			}
		}
		return pudo;
	}
	
	public abstract boolean esPosibleExtraer(double unMonto);
	
	public abstract void cobrarMantenimiento();
	
}
