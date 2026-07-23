package FinalMarzo2024;

public class Sector {
	private String nombre;
	private Empleado jefe;
	private Empleado [] empleados;
	private Producto [] productos;
	
	private int dimEmple;
	private int dimProd;
	
	public Sector(int cantidad, String nom) {
		this.nombre = nom;
		
		this.empleados = new Empleado[50];
		this.productos = new Producto[cantidad];
		this.dimEmple = 0;
		this.dimProd = 0;
	}
	/*A*/
	public void agregarEmpleado(Empleado unEmpleado, boolean esJefe) {
		if (esJefe) {
			this.jefe = unEmpleado;
		}
		else {
			this.empleados[dimEmple] = unEmpleado;
			this.dimEmple++;
		}
	}
	/*B*/
	public void agregarProducto(Producto unProd) {
		this.productos[this.dimProd] = unProd;
		this.dimProd++;
	}
	
	/*C*/
	public double getCostoTotal(int etapa) {
		double costo = 0;
		for (int i = 0; i < dimProd; i ++) {
			if (this.productos[i].getEtapa() == etapa) {
				costo += this.productos[i].getCosto();
			}
		}
		return costo;
	}
	
	/*D*/
	public void cambiarEtapa(int cod, double costo) {
		int i = 0;
		boolean encontre = false;
		while (i < dimProd && !encontre){
			if (this.productos[i].getCodigo() == cod) {
				this.productos[i].aumentarEtapa();
				this.productos[i].aumentarCosto(costo);
				encontre = true;
			}
			i++;
		}
	}
	
	/*E*/
	public String toString() {
		String resultado = "";
		/*Nombre del sector*/
		resultado += "Nombre del sector " + this.nombre + "\n"; 
		
		/*Datos del jefe*/
		resultado += "Datos del jefe : " + this.jefe.toString() + "\n";
		
		/*Cantidad de productos */
		resultado += "Cantidad de productos : " + this.dimProd + "\n";
		
		/*Costo total de los productos finalizados*/
		double costo = 0;
		for (int i = 0;i < dimProd; i ++) {
			if (this.productos[i].getEtapa() == 5) {
				costo += this.productos[i].getCosto();
			}
		}
		
		resultado += "Costo total de productos finalizados : " + costo + "\n";
		
		resultado+= "Informacion de empleados con mas de 10 años de antiguedad \n";
		for (int i = 0;i < dimEmple; i ++) {
			if (this.empleados[i].getAntiguedad() > 10 ) {
				resultado += this.empleados[i].toString() + "\n";
			}
		}
		return resultado;
	}
	
	
}
