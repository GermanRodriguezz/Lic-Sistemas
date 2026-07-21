package FinalOctubre25;

public class CompañiaDeSeguros {
	private Poliza [][] polizas;
	private int [] dimension;
	
	public CompañiaDeSeguros() {
		this.dimension = new int[10];
		this.polizas = new Poliza[10][200];
	}
	
	
	/*A*/
	public void agregarPoliza(Poliza unaPoliza,int unRubro) {
		this.polizas[unRubro][dimension[unRubro]] = unaPoliza;
		dimension[unRubro]++;
	}
	
	/*B*/
	public String infoCliente(int dniCliente) {
		String resultado = "";
		for (int i = 0;i < 10;i++) {
			for(int j =0; j < dimension[i];j++) {
				if (polizas[i][j].getDni() == dniCliente) {
					resultado += polizas[i][j].getInformacion() + "\n";
				}
			}
		}
		return resultado;
	}
	
	/*C*/
	public void aumentarCuotas(double unPorcentaje, int unRubro) {
		for (int i = 0; i < dimension[unRubro]; i++) {
			this.polizas[unRubro][i].aumentarCuota(unPorcentaje);;
		}
	}
	
	
}
