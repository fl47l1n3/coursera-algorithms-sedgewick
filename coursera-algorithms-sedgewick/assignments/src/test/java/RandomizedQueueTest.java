import edu.princeton.cs.algs4.StdOut;
import java.util.Iterator;
import java.util.Arrays;
import java.util.NoSuchElementException;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class RandomizedQueueTest extends TestCase {

    public void testEnque() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        rq.enqueue(1);
        rq.enqueue(2);
        rq.enqueue(3);

        assertEquals(3, rq.size());
    }

    public void testIsEmpty() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        rq.enqueue(1);
        rq.enqueue(2);
        rq.dequeue();
        rq.dequeue();

        assertTrue(rq.isEmpty());
    }

    public void testDeque() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        rq.enqueue(1);
        rq.enqueue(2);
        rq.enqueue(3);
        rq.enqueue(4);
        rq.enqueue(5);

        rq.dequeue();
        rq.dequeue();
        assertEquals(3, rq.size());

        rq.dequeue();
        assertEquals(2, rq.size());
    }

    public void testSample() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        rq.enqueue(1);
        rq.enqueue(2);
        rq.enqueue(3);

        rq.sample();
        rq.sample();
        assertEquals(3, rq.size());
    }

    public void testIterator() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        rq.enqueue(1);
        rq.enqueue(2);
        rq.enqueue(3);

        Integer[] r1 = new Integer[3];
        Iterator<Integer> it1 = rq.iterator();
        int i1 = 0;

        while (it1.hasNext()) {
            r1[i1] = it1.next();
            i1++;
        }

        assertEquals(3, r1.length);
    }

    public void testIteratorTwoArrays() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        rq.enqueue(1);
        rq.enqueue(2);
        rq.enqueue(3);

        Integer[] r1 = new Integer[3];
        Integer[] r2 = new Integer[3];
        Iterator<Integer> it1 = rq.iterator();
        Iterator<Integer> it2 = rq.iterator();
        int i1 = 0;
        int i2 = 0;

        while (it1.hasNext()) {
            r1[i1] = it1.next();
            i1++;
        }
        while (it2.hasNext()) {
            r2[i2] = it2.next();
            i2++;
        }

        assertTrue(!Arrays.equals(r1, r2));
    }

    public void testTwoNestedIterators() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        for (int i = 0; i < 10; i++) {
            rq.enqueue(i);
        }

        int r1 = 0;
        int r2 = 0;

        Iterator<Integer> it1 = rq.iterator();
        while (it1.hasNext()) {
            int v1 = it1.next();
            r1++;

            Iterator<Integer> it2 = rq.iterator();
            while (it2.hasNext()) {
                int v2 = it2.next();
                r2++;
            }
        }

        assertEquals(10, r1);
        assertEquals(100, r2);
    }

    //============ Test validation ============================================
    public void testNullPointerException() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        try {
            rq.enqueue(null);
            fail("enqueue is not throw NullPointerException");
        } catch (NullPointerException e) {
            assertTrue("Good", true);
        }
    }

    public void testNoSuchElementException() {
        RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
        rq.enqueue(1);
        rq.dequeue();

        try {
            rq.dequeue();
            fail("dequeue is not throw NullPointerException");
        } catch (NoSuchElementException e) {
            assertTrue("Good", true);
        }

        try {
            rq.sample();
            fail("sample is not throw NullPointerException");
        } catch (NoSuchElementException e) {
            assertTrue("Good", true);
        }

        rq.enqueue(1);
        Iterator<Integer> iterator = rq.iterator();
        iterator.next();
        try {
            iterator.next();
            fail("next is not throw NullPointerException");
        } catch (NoSuchElementException e) {
            assertTrue("Good", true);
        }
    }

}
