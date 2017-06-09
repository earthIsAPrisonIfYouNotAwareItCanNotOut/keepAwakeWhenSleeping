// HelloDate.java
/**
 * 1) bring extra classes you'll need for the code (Data -> java.util.Data -> java.util.*)
 * 2) it's static, the out object is determined by its type: PrintStream
 * 3) main() is an array of String objects, args holdthe arguments from the command line
 * 4) a Data object that is being created just to send its value (converted to a String) to println()
 */
import java.util.*;  // 1
public class HelloDate {
    public static void main(String[] args) {  // 3
        System.out.println("Hello, it’s: ");  // 2
        System.out.println(new Date());  // 4
    }
}
