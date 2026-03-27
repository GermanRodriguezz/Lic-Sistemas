package tp1.ejercicio3;
import java.util.ArrayList;
	public class Test {
		public static void main (String [] args) {
			Estudiante est = new Estudiante();
			Profesor pf = new Profesor();
			
			Estudiante [] arregloE = new Estudiante [2];
			Profesor [] arregloP = new Profesor [3];
			
			
			for(int i = 0; i < arregloE.length;i++) {
				arregloE[i].setNombre("carlos");
				arregloE[i].setApellido("tevez");
				arregloE[i].setComision(4);
				arregloE[i].setDire("n961");
				arregloE[i].setEmail("jj");
				System.out.println(arregloE[i].tusDatos());
			}
			
		}
}
