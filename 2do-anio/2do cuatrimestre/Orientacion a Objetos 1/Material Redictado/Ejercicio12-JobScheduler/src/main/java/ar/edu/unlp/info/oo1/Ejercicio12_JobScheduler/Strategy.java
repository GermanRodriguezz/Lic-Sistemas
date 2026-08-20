package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;
import java.util.List;

/*sera una interface debido que se usa como tipo de dato y hay un metodo que debe repetirse
 * */
public interface Strategy {
	//metodo que cada tipo realiza a su manera.
	public JobDescription next(List<JobDescription> jobs);
}
