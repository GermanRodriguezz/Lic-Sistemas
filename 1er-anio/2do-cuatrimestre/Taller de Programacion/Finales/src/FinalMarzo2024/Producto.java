package FinalMarzo2024;

public class Producto {
	private int codigo;
	private double costoTotal;
	private int etapa;
	
	public Producto(int cod, int eta) {
		this.codigo = cod;
		this.costoTotal = 0;
		this.etapa = eta;
	}
	
	
	public double getCosto() {
		return this.costoTotal;
	}
	
	public int getEtapa() {
		return this.etapa;
	}
	
	public void aumentarEtapa() {
		if (this.etapa < 5)
			this.codigo++;
	}
	
	public void aumentarCosto(double cos) {
		this.costoTotal += cos;
	}
	
	public int getCodigo() {
		return this.codigo;
	}
}
