package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;

public class JobDescription {
	private String description;
	private double effort;
	private int priority;
	
	public JobDescription(double e, int p,String d) {
		this.description = d;
		this.effort = e;
		this.priority = p;
	}
	
	
	public String getDescription() {
		return this.description;
	}
	
	public double getEffort() {
		return this.effort;
	}
	
	public int getPriority() {
		return this.priority;
	}
}
