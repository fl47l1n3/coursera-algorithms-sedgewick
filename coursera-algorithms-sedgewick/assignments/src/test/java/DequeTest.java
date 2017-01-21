import java.util.Iterator;
import java.util.NoSuchElementException;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class DequeTest extends TestCase {

    //============ Simple adds ================================================
    public void testAddFirst() {
        Deque<String> deque = new Deque<String>();
        deque.addFirst("1");
        deque.addFirst("2");
        deque.addFirst("3");
        assertEquals(3, deque.size());
    }

    public void testAddLast() {
        Deque<String> deque = new Deque<String>();
        deque.addLast("1");
        deque.addLast("2");
        deque.addLast("3");
        assertEquals(3, deque.size());
    }

    public void testAddLastAndLast() {
        Deque<String> deque = new Deque<String>();
        deque.addFirst("1");
        deque.addFirst("2");
        deque.addLast("3");
        deque.addLast("4");
        assertEquals(4, deque.size());
    }

    //============ Remove first ===============================================
    public void testRemoveFirstForFirstAdded() {
        Deque<String> deque = new Deque<String>();
        deque.addFirst("1");
        deque.addFirst("2");
        deque.addFirst("3");

        String val = deque.removeFirst();
        assertEquals("3", val);
        val = deque.removeFirst();
        assertEquals("2", val);
        val = deque.removeFirst();
        assertEquals("1", val);

        assertTrue(deque.isEmpty());
    }

    public void testRemoveFirstForLastAdded() {
        Deque<String> deque = new Deque<String>();
        deque.addLast("1");
        deque.addLast("2");
        deque.addLast("3");

        String val = deque.removeFirst();
        assertEquals("1", val);
        val = deque.removeFirst();
        assertEquals("2", val);
        val = deque.removeFirst();
        assertEquals("3", val);

        assertTrue(deque.isEmpty());
    }

    //============ Remove last ================================================
    public void testRemoveLastForFirstAdded() {
        Deque<String> deque = new Deque<String>();
        deque.addFirst("1");
        deque.addFirst("2");
        deque.addFirst("3");

        String val = deque.removeLast();
        assertEquals("1", val);
        val = deque.removeLast();
        assertEquals("2", val);
        val = deque.removeLast();
        assertEquals("3", val);

        assertTrue(deque.isEmpty());
    }

    public void testRemoveLastForLastAdded() {
        Deque<String> deque = new Deque<String>();
        deque.addLast("1");
        deque.addLast("2");
        deque.addLast("3");

        String val = deque.removeLast();
        assertEquals("3", val);
        val = deque.removeLast();
        assertEquals("2", val);
        val = deque.removeLast();
        assertEquals("1", val);

        assertTrue(deque.isEmpty());
    }

    //============ Remove first and last ======================================
    public void testRemoveFirstAndLast() {
        Deque<String> deque = new Deque<String>();
        deque.addFirst("1");
        deque.addFirst("2");
        deque.addLast("3");
        deque.addLast("4");
        deque.addFirst("5");
        deque.addLast("6");

        String val = deque.removeLast();
        assertEquals("6", val);
        val = deque.removeFirst();
        assertEquals("5", val);
        val = deque.removeFirst();
        assertEquals("2", val);
        val = deque.removeFirst();
        assertEquals("1", val);
        val = deque.removeLast();
        assertEquals("4", val);

        assertEquals(1, deque.size());
    }

    //============ Iterator ===================================================
    public void testIterator() {
        Deque<String> deque = new Deque<String>();
        deque.addFirst("1");
        deque.addFirst("2");
        deque.addLast("3");
        deque.addLast("4");
        deque.addFirst("5");
        deque.addLast("6");

        Iterator<String> iterator = deque.iterator();
        assertEquals("5", iterator.next());
        assertEquals("2", iterator.next());
        assertEquals("1", iterator.next());
        assertEquals("3", iterator.next());
        assertEquals("4", iterator.next());
        assertEquals("6", iterator.next());
    }

    //============ Test validation ============================================
    public void testNullPointerException() {
        Deque<String> deque = new Deque<String>();

        try {
            deque.addFirst(null);
            fail("addFirst is not throw NullPointerException");
        } catch (NullPointerException e) {
            assertTrue("Good", true);
        }

        try {
            deque.addLast(null);
            fail("addLast is not throw NullPointerException");
        } catch (NullPointerException e) {
            assertTrue("Good", true);
        }
    }

    public void testNoSuchElementException() {
        Deque<String> deque = new Deque<String>();
        deque.addFirst("1");
        deque.removeFirst();

        try {
            deque.removeFirst();
            fail("removeFirst is not throw NoSuchElementException");
        } catch (NoSuchElementException e) {
            assertTrue("Good", true);
        }

        deque.addFirst("1");
        deque.removeFirst();
        try {
            deque.removeLast();
            fail("removeLast is not throw NoSuchElementException");
        } catch (NoSuchElementException e) {
            assertTrue("Good", true);
        }

        deque.addFirst("1");
        Iterator<String> iterator = deque.iterator();
        iterator.next();
        try {
            iterator.next();
            fail("next() is not throw NoSuchElementException");
        } catch (NoSuchElementException e) {
            assertTrue("Good", true);
        }
    }

}
