/**
 * Created by sb on 2017/9/20.
 */

/// java.util package

import sun.security.util.Password;

import java.io.Console;
import java.util.*;

public class InputTest {
    public static void main(String[] args) {
        /// System.in

        /// Scanner

        Scanner in = new Scanner(System.in);

        /// nextLine

        // now you can use the various methods of the Scanner class to read input
        //   for example, the nextLine method

        /// next

        // here, we use the nextLine method because the input might contain spaces
        // to read a single word (delimited by whitespace), use next
        //   String firstName = in.next();

        // get first input
        System.out.print("What is your name? ");
        String name = in.nextLine();

        /// nextInt

        // get second input
        System.out.print("How old are you? ");
        int age = in.nextInt();

        // display output on console
        System.out.println("Hello, " + name + ". Next year, you'll be " + (age + 1));

        /// console

        // the Scanner class is not suitable for reading a password from a console
        //   since the input is plainly visible to anyone
        // java SE 6 introduces a Console class to read a password

        // for security reasons
        //   the password is returned in an array of characters rather than a string
        // input processing with a Console object is not as convenient as with a Scanner

        Console cons = System.console();
        String username = cons.readLine("User name:");
        char[] passwd = cons.readPassword("Password:" );

    }
}
