import edu.princeton.cs.algs4.StdOut;
import java.util.Iterator;
import java.util.NoSuchElementException;


public class Deque<Item> implements Iterable<Item> {

    private Node first = null;
    private Node last = null;
    private int size = 0;

    private class Node {

        private Item item;
        private Node next;
        private Node prev;

        public Node(Item item, Node next, Node prev) {
            this.item = item;
            this.next = next;
            this.prev = prev;
        }

    }

    private class ListIterator implements Iterator<Item> {

        private Node current = first;

        public boolean hasNext() {
            return current != null;
        }

        public void remove() {
            throw new java.lang.UnsupportedOperationException();
        }

        public Item next() {
            if (current == null) {
                throw new NoSuchElementException();
            }

            Item item = current.item;
            current = current.next;
            return item;
        }

    }

    public Deque() {
    }

    public boolean isEmpty() {
        return first == null;
    }

    public int size() {
        return size;
    }

    public void addFirst(Item item) {
        if (item == null) {
            throw new NullPointerException();
        }

        Node oldFirst = first;
        first = new Node(item, oldFirst, null);

        if (oldFirst == null) {
            last = first;
        } else {
            oldFirst.prev = first;
        }

        size++;
    }

    public void addLast(Item item) {
        if (item == null) {
            throw new NullPointerException();
        }

        Node oldLast = last;
        last = new Node(item, null, oldLast);

        if (oldLast == null) {
            first = last;
        } else {
            oldLast.next = last;
        }

        size++;
    }

    public Item removeFirst() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }

        Node result = first;

        if (first.next != null) {
            first = first.next;
            first.prev = null;
        } else {
            first = null;
            last = null;
        }

        size--;
        return result.item;
    }

    public Item removeLast() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }

        Node result = last;

        if (last.prev != null) {
            last = last.prev;
            last.next = null;
        } else {
            first = null;
            last = null;
        }

        size--;
        return result.item;
    }

    public Iterator<Item> iterator() {
        return new ListIterator();
    }


    public static void main(String[] arg) {
        Deque<String> deque = new Deque<String>();

        StdOut.printf("Deque size=%d\n", deque.size());
        Iterator<String> iterator = deque.iterator();
        while (iterator.hasNext()) {
            StdOut.printf("%s, ", iterator.next());
        }

        StdOut.print("\n");
    }

}
