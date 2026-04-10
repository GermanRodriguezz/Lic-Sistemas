package tp1.ejercicio8;

public class CircularQueue<T> extends Queue<T> {

    public T shift() {
        T elem = this.dequeue();
        if (elem != null) {
            this.enqueue(elem);
        }
        return elem;
    }
}
