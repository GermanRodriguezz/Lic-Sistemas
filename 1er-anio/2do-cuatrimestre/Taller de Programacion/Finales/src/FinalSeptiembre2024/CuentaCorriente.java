package FinalSeptiembre2024;

public class CuentaCorriente extends Cuenta{
	private double acuerdo;
	
	public CuentaCorriente(double ac,int numcuenta,int dni) {
		super(numcuenta,dni);
		this.acuerdo = ac;
	}
	
	public double getAcuerdo() {
		return this.acuerdo;
	}
	
	public boolean esPosibleExtraer(double unMonto) {
		return (this.getAcuerdo() + this.getSaldo()) > unMonto; 
	}
	
	public void cobrarMantenimiento() {
		
		double base = 50 * this.getAcuerdo();
		
		if (this.esPosibleExtraer(base)) {
			this.extraer(base);
		}
		else {
			this.cancelarCuenta();
		}
		
	}
	
	public String resumen() {
		
		return this.toString() + " El acuerdo es de : " + this.getAcuerdo();
	}
	
}
