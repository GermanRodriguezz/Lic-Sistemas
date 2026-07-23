package FinalOctubre2024;

public class Cama {
	private int identificacion;
	private boolean ocupada;
	private int cantDiasOcupadas;
	private Paciente paciente;
	
	public Cama(int id) {
		this.identificacion = id;
		this.ocupada = false;
		this.cantDiasOcupadas = 0;
		this.paciente = null;
	}
	
	public int getId() {
		return this.identificacion;
	}
	
	public boolean getOcupada(){
		return this.ocupada;
	}
	
	public Paciente getPaciente() {
		return this.paciente;
	}
	
	public int getCantDias() {
		return this.cantDiasOcupadas;
	}
	
	public void incrementarDias() {
		this.cantDiasOcupadas++;
	}
	
	public void agregarPaciente(Paciente pacie) {
		this.paciente = pacie;
		this.ocupada = true;
		this.cantDiasOcupadas = 0;
	}
	
	public void liberarCama() {
		if (ocupada) {
			ocupada = false;
			paciente = null;
			cantDiasOcupadas = 0;
		}
	}
	
	public int getDniPaciente() {
		if (ocupada)
			return this.paciente.getDni();
		return -1;
	}
}
