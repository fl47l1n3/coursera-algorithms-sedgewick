import edu.princeton.cs.algs4.StdOut;
import edu.princeton.cs.algs4.StdRandom;
import java.util.Iterator;
import java.util.NoSuchElementException;


public class RandomizedQueue<Item> implements Iterable<Item> {

    private static final int INITIAL_SIZE = 10;
    private static final int ASCENDING = 0;
    private static final int DESCENDING = 1;

    private Item[] data;
    private int index = 0;
    private int order = DESCENDING;

    private class ArrayIterator implements Iterator<Item> {

        private int i = 0;
        private int order;

        public ArrayIterator(int order) {
            this.order = order;
        }

        public boolean hasNext() {
            return i < index;
        }

        public void remove() {
            throw new java.lang.UnsupportedOperationException();
        }

        public Item next() {
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            if (ASCENDING == this.order) {
                return data[i++];
            } else {
                int ix = index - i - 1;
                i++;
                return data[ix];
            }
        }

    }

    public RandomizedQueue() {
        this.data = (Item[]) new Object[INITIAL_SIZE];
        StdRandom.setSeed(System.currentTimeMillis());
    }

    private void resize(int capacity) {
        Item[] copy = (Item[]) new Object[capacity];
        for (int i = 0; i < index; i++) {
            if (data[i] != null) {
                copy[i] = data[i];
            }
        }
        data = copy;
    }

    public boolean isEmpty() {
        return index == 0;
    }

    public int size() {
        return index;
    }

    public void enqueue(Item item) {
        if (item == null) {
            throw new NullPointerException();
        }

        if (index == data.length) {
            resize(2 * data.length);
        }

        if (!isEmpty()) {
            int rndIndex = StdRandom.uniform(index);
            Item randomItem = data[rndIndex];
            data[rndIndex] = item;
            data[index++] = randomItem;
        } else {
            data[index++] = item;
        }
    }

    public Item dequeue() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }

        Item item = data[--index];
        data[index] = null;

        if (index > 0 && index == data.length / 4) {
            resize(data.length / 2);
        }

        return item;
    }

    public Item sample() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }

        return data[index - 1];
    }


    public Iterator<Item> iterator() {
        order = ASCENDING == order ? DESCENDING : ASCENDING;
        return new ArrayIterator(order);
    }

    public static void main(String[] args) {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();

        for (int i = 0; i < 10; i++) {
            rq.enqueue(i);
        }

        StdOut.printf("RandomizedQueue size=%d\n", rq.size());
        Iterator<Integer> iterator = rq.iterator();
        while (iterator.hasNext()) {
            StdOut.printf("%s, ", iterator.next());
        }

        StdOut.print("\n");
    }

}
