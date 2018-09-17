import edu.princeton.cs.algs4.In;
import edu.princeton.cs.algs4.StdOut;
import edu.princeton.cs.algs4.WeightedQuickUnionUF;


public class Percolation {

    private int size;
    private int rowSize;
    private int virtualTop;
    private int virtualBottom;
    private boolean[] cells;
    private WeightedQuickUnionUF uf;
    private WeightedQuickUnionUF uf2;

    public Percolation(int N) {
        if (N <= 0) {
            throw new IllegalArgumentException();
        }

        rowSize = N;
        size = N * N;
        uf = new WeightedQuickUnionUF(size + 2);
        uf2 = new WeightedQuickUnionUF(size + 2);
        virtualTop = size;
        virtualBottom = size + 1;
        cells = new boolean[size];

        for (int i = 0; i < size; i++) {
            cells[i] = false;
        }
    }

    public void open(int i, int j) {
        if (i <= 0 || i > rowSize || j <= 0 || j > rowSize) {
            throw new IndexOutOfBoundsException();
        }

        int index = getIndex(i, j);
        cells[index] = true;

        int left = getIndex(i, j - 1);
        int right = getIndex(i, j + 1);
        int top = getIndex(i - 1, j);
        int bottom = getIndex(i + 1, j);

        if (j > 1 && cells[left]) {
            uf.union(index, left);
            uf2.union(index, left);
        }
        if (j < rowSize && cells[right]) {
            uf.union(index, right);
            uf2.union(index, right);
        }

        if (i > 1 && cells[top]) {
            uf.union(index, top);
            uf2.union(index, top);
        }
        if (i < rowSize && cells[bottom]) {
            uf.union(index, bottom);
            uf2.union(index, bottom);
        }

        if (index < rowSize) {
            uf.union(index, virtualTop);
            uf2.union(index, virtualTop);
        }
        if (index >= (size - rowSize)) {
            uf2.union(index, virtualBottom);
        }
    }

    public boolean isOpen(int i, int j) {
        if (i <= 0 || i > rowSize || j <= 0 || j > rowSize) {
            throw new IndexOutOfBoundsException();
        }
        return cells[getIndex(i, j)];
    }

    public boolean isFull(int i, int j) {
        if (i <= 0 || i > rowSize || j <= 0 || j > rowSize) {
            throw new IndexOutOfBoundsException();
        }
        return uf.connected(virtualTop, getIndex(i, j)) && isOpen(i, j);
    }

    private int getIndex(int i, int j) {
        return (i - 1) * rowSize + (j - 1);
    }

    public boolean percolates() {
        return uf2.connected(virtualTop, virtualBottom);
    }

    public static void main(String[] args) {
        In in = new In(args[0]);
        int N = in.readInt();
        Percolation perc = new Percolation(N);
        while (!in.isEmpty()) {
            int i = in.readInt();
            int j = in.readInt();
            perc.open(i, j);
        }

        int opened = 0;
        for (int i = 1; i <= N; i++) {
            for (int j = 1; j <= N; j++) {
                if (perc.isOpen(i, j)) {
                    opened++;
                }
            }
        }
    }

}
