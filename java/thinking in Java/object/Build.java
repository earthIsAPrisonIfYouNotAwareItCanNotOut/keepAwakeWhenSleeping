/**
 * compoment
 *
 */

// import classes
import java.util.ArrayList;
import java.util.*;


/**
 * static
 *
 */

class StaticTest {
    static int i = 47;
}
// even if you make two StaticTest object, both objects will share the same i
StaticTest st1 = new StaticTest();
StaticTest st2 = new StaticTest();
StaticTest.i++;  // both st1.i and st2.i is 48

class Incrementable {
    static void increment() { StaticTest.i++; }
}
Incrementable sf = new Incrementable();
sf.increment();
Incrementable.increment();  // you can also refer to a static directly through its class name
