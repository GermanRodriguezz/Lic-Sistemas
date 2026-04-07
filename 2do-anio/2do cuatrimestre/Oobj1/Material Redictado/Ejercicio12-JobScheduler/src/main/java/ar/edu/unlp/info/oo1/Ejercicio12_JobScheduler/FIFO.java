package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;

import java.util.List;

public class FIFO implements Strategy{
	public JobDescription next (List<JobDescription> jobs) {
		JobDescription nextJob = null;
			if (jobs != null) {
				nextJob = jobs.get(0);
				return nextJob;
			}
			return null;
	}
}
