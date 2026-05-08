package tp3.puntoparciales;

import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class ParcialArboles {

		private GeneralTree<Integer> ag;
		
		public static boolean esDeSeleccion(GeneralTree<Integer> a) {
			if (a.isEmpty())
				return false;
			return verificarHijos(a);
		}
		
		private static boolean verificarHijos(GeneralTree<Integer> a) {
			if (a.hasChildren()) {
				
				int hijoMin = Integer.MAX_VALUE;
				List<GeneralTree<Integer>> hijos = a.getChildren();
				
				for (GeneralTree<Integer> hijo : hijos) {
					/*pregunta si el valor del hijo actual es el mas chico*/
					if (hijo.getData() < hijoMin) {
						hijoMin = hijo.getData();
					}
					if(!verificarHijos(hijo))
						return false;
				}
				
				if (!a.getData().equals(hijoMin)){
					return false;
				}
			}
			return true;
		/*cuando encuentra una hoja debe verificar los valores*/
		}
}
