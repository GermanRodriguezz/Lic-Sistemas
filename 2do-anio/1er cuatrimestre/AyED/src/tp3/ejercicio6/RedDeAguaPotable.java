package tp3.ejercicio6;

import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class RedDeAguaPotable {
	GeneralTree<Character> Acaudal;
	
	
	public double minimoCaudal(double caudal) {
		
		if (Acaudal == null)
			return 0;
		return min(Acaudal, caudal);
	}
		
	private double min(GeneralTree<Character> a, double c) {
		
		if (!a.hasChildren())
			return c;
		double min = Double.MAX_VALUE;
			
		int canthijos = a.getChildren().size(); /*cant de hijos - cantidad para dividir el caudal*/
			
		/* mandar ese caudal / hijos*/
		double caudalDelHijo = c / canthijos;
			
		List<GeneralTree<Character>> hijos = a.getChildren();
			
		for (GeneralTree<Character> hijo : hijos) {
				
			double minDelHijo = min(hijo,caudalDelHijo);
			
			if (minDelHijo <= min) {
					min = minDelHijo;
			}
		}
		return min;
	}
}
