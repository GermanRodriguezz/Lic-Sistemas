package tp1.ejercicio3;
	public class Test {
		public static void main (String [] args) {
			
			Estudiante [] arregloE = new Estudiante [2];
			Profesor [] arregloP = new Profesor [3];
			
			arregloE[0] = new Estudiante();
			arregloE[1] = new Estudiante();
			
			arregloP[0] = new Profesor();
			arregloP[1] = new Profesor();
			arregloP[2] = new Profesor();
			
			for(int i = 0; i < arregloE.length;i++) {
				arregloE[i].setNombre("carlos+i");
				arregloE[i].setApellido("tevez+i");
				arregloE[i].setComision(4);
				arregloE[i].setDire("n961+i");
				arregloE[i].setEmail("jj+i");
				System.out.println(arregloE[i].tusDatos());
			}
			for (int i = 0; i < arregloP.length;i++) {
				arregloP[i].setNombre("juan+i");
				arregloP[i].setApellido("Perez+i");
				arregloP[i].setCatedra("fm+i");
				arregloP[i].setComision(3);
				arregloP[i].setEmail("gmail+i");
				arregloP[i].setFacultad("UNLP+i");
				System.out.println(arregloP[i].tusDatos());
			}

		}
}
