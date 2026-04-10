package tp1.ejercicio8;
import java.util.*;

	public class Queue<T> implements Sequence<T> {

	    protected List<T> data;

	    public Queue() {
	        this.data = new LinkedList<>();
	    }

	    public void enqueue(T dato) {
	        data.add(dato);
	    }

	    public T dequeue() {
	        if (this.isEmpty()) {
	            return null;
	        }
	        return data.remove(0);
	    }

	    public T head() {
	        if (this.isEmpty()) {
	            return null;
	        }
	        return data.get(0);
	    }

	    @Override
	    public int size() {
	        return data.size();
	    }

	    @Override
	    public boolean isEmpty() {
	        return data.isEmpty();
	    }

	    @Override
	    public String toString() {
	        return data.toString();
	    }
	}

