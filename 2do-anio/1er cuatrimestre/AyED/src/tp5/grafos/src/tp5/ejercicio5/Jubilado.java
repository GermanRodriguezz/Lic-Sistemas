package tp5.grafos.src.tp5.ejercicio5;

public class Jubilado extends Persona{
	private boolean cobroEsteMes;
	
	public Jubilado(String n,String d,boolean cobro) {
		super(n,d);
		this.cobroEsteMes = cobro;
	}
	
	public boolean getCobroEsteMes() {
		return this.cobroEsteMes;
	}
	
	public boolean getCobro() {
		return this.cobroEsteMes;
	}
	
}
