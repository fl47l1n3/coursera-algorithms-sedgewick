import edu.princeton.cs.algs4.StdIn;
import edu.princeton.cs.algs4.StdOut;


public class Subset {

    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);

        RandomizedQueue<String> rq = new RandomizedQueue<String>();
        while (!StdIn.isEmpty()) {
            rq.enqueue(StdIn.readString());
        }

        if (N < 0 || N > rq.size()) {
            throw new IllegalArgumentException();
        }

        for (int i = 0; i < N; i++) {
            StdOut.printf("%s\n", rq.dequeue());
        }
    }

}
