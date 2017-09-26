/**
 * Created by sb on 2017/9/11.
 */
public class CombiningAssignmentWithOperators {
    public static void main(String[] args) {
        // x +=4;
        // is equivalent to
        // x = x + 4

        // NOTE
        // if the operator yields a value whose type is different than that of the left-hand side
        //   then it is coerced to fit
        // x += 3.5;
        // setting x to (int)(x + 3.5)

        // increment and decrement operators
        int n = 12;
        n++; // 13
        // there is also a prefix form
        // ++n
        // the difference is in expression
        //   the prefix form does the addition first
        //   the postfix form evaluates to the old value of the variable
        int u = 7;
        int m = 7;
        int a = 2 * ++m; // now a is 16, m is 8
        int b = 2 * u++; // now b is 14, u is 8
        // TIP
        // we recommend against using ++ inside expressions
    }
}
