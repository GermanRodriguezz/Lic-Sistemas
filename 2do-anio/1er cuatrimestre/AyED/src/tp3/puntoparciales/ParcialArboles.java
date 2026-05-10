package tp3.puntoparciales;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

/*PUNTO 9*/

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



/*PUNTO 10*/

		public static List<Integer> resolver(GeneralTree<Integer> a){
			List<Integer> listaResultado = new LinkedList<Integer>();
			
			int sumaMax = -1;
			
			if (a.isEmpty()) {
				return listaResultado;
			}
			devolverCamino(a,listaResultado, new LinkedList<Integer>(),0,sumaMax,0);
			return listaResultado;
		}
		
		private static int devolverCamino(GeneralTree<Integer> a, List<Integer> lr, List<Integer> la, Integer suma, int sumaMax,Integer nivel){
			boolean agg = false;
			
			suma += a.getData() * nivel;
			
			if (a.getData().equals(1)) {
				la.add(a.getData());
				agg = true;
			}
			
			if (a.isLeaf()) {
				if (suma > sumaMax) {
					sumaMax = suma;
					lr.clear();
					lr.addAll(la); /*llegamos a una hoja y vemos si la suma que lleva es mayor que max*/
				}
			}
			
			for (GeneralTree<Integer> child : a.getChildren()) {
				sumaMax = devolverCamino(child, lr, la, suma, sumaMax, nivel+1);
			}
			
			
			if (agg)
				la.remove(la.size()-1);
			return sumaMax;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}