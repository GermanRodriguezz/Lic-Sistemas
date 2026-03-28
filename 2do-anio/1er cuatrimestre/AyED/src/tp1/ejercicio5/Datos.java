package tp1.ejercicio5;

public class Datos {
	private int maximo;
	private int minimo;
	private double promedio;
	
	public Datos() {
	}
	
	public Datos(int max,int min,double prom) {
		this.maximo = max;
		this.minimo = min;
		this.promedio = prom;
	}

	public int getMaximo() {
		return maximo;
	}

	public void setMaximo(int maximo) {
		this.maximo = maximo;
	}

	public int getMinimo() {
		return minimo;
	}

	public void setMinimo(int minimo) {
		this.minimo = minimo;
	}

	public double getPromedio() {
		return promedio;
	}

	public void setPromedio(double promedio) {
		this.promedio = promedio;
	}
	
	public String toString() {
		return "Maximo : " + this.maximo + ", Minimo : " + this.minimo + ", Promedio : " + this.promedio;
	}
}
