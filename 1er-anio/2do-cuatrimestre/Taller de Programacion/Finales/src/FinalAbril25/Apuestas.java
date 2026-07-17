package FinalAbril25;

import java.util.*;

public class Apuestas {
	private String name;
	private int dni;
	private int idPartido;
	private String apuestaPor;
	private double montoApostado;
	
	
	public Apuestas() {}
	
	public Apuestas(String nom,int dn,int ide,String app, double mon) {
		this.name = nom;
		this.dni = dn;
		this.idPartido = ide;
		this.apuestaPor = app;
		this.montoApostado = mon;
	}
	
	
	public int getIdPartido() {
		return this.idPartido;
	}
	
	public String getApuestaPor() {
		return this.apuestaPor;
	}
	
	public double getMontoApostado() {
		return this.montoApostado;
	}
	
	public String getNombre() {
		return this.name;
	}
	
	public int getDNI() {
		return this.dni;
	}
	
}
