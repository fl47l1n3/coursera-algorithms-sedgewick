import edu.princeton.cs.algs4.StdOut;
import edu.princeton.cs.algs4.StdRandom;

public class PercolationStats {

    private double mean = 0.0;
    private double stddev = 0.0;
    private double confidenceLo = 0.0;
    private double confidenceHi = 0.0;

    public PercolationStats(int N, int T) {
        if (N <= 0 || T <= 0) {
            throw new IllegalArgumentException();
        }
        double[] thresolds = new double[T];
        for (int c = 0; c < T; c++) {
            Percolation perc = new Percolation(N);
            int openCount = 0;
            while (!perc.percolates()) {
                int i = StdRandom.uniform(N) + 1;
                int j = StdRandom.uniform(N) + 1;
                if (!perc.isOpen(i, j)) {
                    perc.open(i, j);
                    openCount++;
                }
            }
            double thres = openCount / (double) (N * N);
            thresolds[c] = thres;
        }

        double thresoldSum = 0.0;
        for (int c = 0; c < T; c++) {
            thresoldSum += thresolds[c];
        }
        mean = thresoldSum / (double) T;

        double thresDeviationSum = 0.0;
        for (int c = 0; c < T; c++) {
            double result = thresolds[c] - mean;
            result = result * result;
            thresDeviationSum += result;
        }
        stddev = thresDeviationSum / (double) (T - 1);
        stddev = Math.sqrt(stddev);

        confidenceLo = mean - (1.96 * stddev / Math.sqrt(T));
        confidenceHi = mean + (1.96 * stddev / Math.sqrt(T));
    }

    public double mean() {
        return mean; 
    }

    public double stddev() {
        return stddev;
    }

    public double confidenceLo() {
        return confidenceLo;
    }

    public double confidenceHi() {
        return confidenceHi;
    }

    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        int T = Integer.parseInt(args[1]);

        PercolationStats percolationStats = new PercolationStats(N, T);
        StdOut.printf("mean\t\t\t = %f\n", percolationStats.mean());
        StdOut.printf("stddev\t\t\t = %f\n", percolationStats.stddev());
        StdOut.printf(
            "95%% confidence interval\t = %f, %f\n",
            percolationStats.confidenceLo(),
            percolationStats.confidenceHi()
        );
    }

}
