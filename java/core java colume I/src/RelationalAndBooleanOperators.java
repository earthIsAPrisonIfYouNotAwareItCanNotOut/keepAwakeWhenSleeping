/**
 * Created by sb on 2017/9/11.
 */
public class RelationalAndBooleanOperators {
    public static void main(String[] args) {
        /// relational operators

        // to test for equality, use a double equal sign, ==
        // 3 == 7
        // is false

        // use a != for inequality
        // 3 != 7
        // is true

        // logical and &&
        // if one of the expression has been determined to be false
        //   then it is impossible for the result to be true
        //   thus, the value for the second expression is not calculated
        // x != 0 && 1 / x > x + y
        // the second part is never evaluated if x equals zero

        // logical or ||
        // the expression is automatically true if the one of expression is true

        // ternary operator ?:
        // evaluates to the first expression if the condition is true
        //   to the second expression otherwise
        // x < y ? x : y
    }
}
