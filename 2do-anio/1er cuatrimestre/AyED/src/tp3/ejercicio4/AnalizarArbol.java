package tp3.ejercicio4;
import java.util.List;

import tp1.ejercicio8.Queue;
import tp3.ayed2024.src.tp3.ejercicio1.GeneralTree;

/*para este inciso noto un recorrido por niveles como mayor comodidad
 * 
 * */
public class AnalizarArbol {
	
	public double devolverMaximoPromedio(GeneralTree<Integer> a) {
		double promMax = 0;
		if (!a.isEmpty()) {
			
			Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
			cola.enqueue(a); /*encolo la raiz*/
			double acumulado;
			while (!cola.isEmpty()) { /*mientras la cola no este vacia*/
				acumulado = 0;
				int size = cola.size(); /*cantidad de nodos que tengo del nivel actual*/
					
				for (int i =0; i < size ; i++) {
					GeneralTree<Integer> nodo = cola.dequeue(); /*nodo es lo que tiene la cola */
					acumulado += nodo.getData();
					List<GeneralTree<Integer>> children = nodo.getChildren(); /*lista de los hijos del nodo*/
					
					
					for (GeneralTree<Integer> child : children) {		/* recorre los hijos del nodo*/
						cola.enqueue(child);					/*encola los hijos*/
					}
				}
					
					double prom = acumulado % size;
					if(prom>promMax) promMax = acumulado;
				}
			}
			return promMax;
		}
	}
