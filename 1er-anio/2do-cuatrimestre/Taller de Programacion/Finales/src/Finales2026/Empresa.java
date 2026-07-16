package Finales2026;

public class Empresa {
	private String nameEmpresa;
	private int direccion;
	private Oficina [] [] oficinas;
	
	public Empresa(String name,int dir) {
		this.nameEmpresa = name;
		this.direccion = dir;
		
		Oficina [][] oficinas = new Oficina [2] [9]; /*0, 1, 2 - 0,.., 9 (hay 10)*/
		for (int i = 0; i<3; i++) {
			for (int j= 0; j<10;j++) {
				oficinas[i][j] = new Oficina();
			}
		}
		
		
	}
	/*A*/
	public void realizarAlquiler(Persona inquilino, double mont,int piso,int numofi) {
		if (oficinas[piso][numofi] != null) {
			oficinas[piso][numofi].aggInquilino(inquilino);
			oficinas[piso][numofi].setCosto(mont);
		}
	}
	
	/*B*/
	
	private void buscar(int dni, int f, int c) {
		int i = 0;
		int j = 0;
		boolean encontre = false;
		while (i < 3 && !encontre) {
			while (j < 10 && !encontre) {
				if (oficinas[i][j].getInquilino().getDni() == dni) {
					encontre = true;
					f = i;
					c = j;
				}
				j++;
			}
			i++;
		}
		
	}
	
	public void liberarOficina(int dni, boolean dejar) {
		int fila = -1;
		int columna = -1;
		buscar(dni,fila,columna);
		if (fila != -1 && columna != -1) {
			oficinas[fila][columna] = null;
			}
		if (dejar) {
			oficinas[fila][columna].setAmueblada(true);
		}
		else {
			oficinas[fila][columna].setAmueblada(false);
		}
	}
	
	
}
