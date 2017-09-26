import java.util.Date;

/**
 * Created by sb on 2017/9/26.
 */
public class FormattingOutput {
    public static void main(String[] args) {
        /// System.out.print

        double x = 9999.0 / 3.0;
        System.out.print(x);
        // prints
        // 3333.3333333333335

        /// System.out.printf

        // prints x with a field width of 8 characters
        //   and a precision of 2 characters
        System.out.printf("%8.2f", x);
        // prints
        // 3333.33

        // supply multiple parameters to printf
        // System.out.printf("Hello, %s. Next year, you'll be %d", name, age);

        // specify flags that control the appearance of the formatted output

        System.out.printf("%,.2f", 10000.0 / 3.0);
        // prints
        // 2,333.33
        // if you use %,( then you will get (2,333.33

        // data and time output format

        System.out.printf("%tc", new Date());
        // prints
        // Mon Feb 09 18:05:19 PST 2015

        System.out.printf("%1$s %2$tB %2$te, %2$tY", "Due date:", new Date());
        // prints
        // Due date: February 8, 2015

        // a syntax for format specifiers
    }
}
