/**
 * Created by sb on 2017/9/5.
 */
public class InitializingVariables {
    public static void main(String[] args) {
        /// uninitialized variable

        int vacationDays;
        System.out.println(vacationDays); // ERROR--variable not initialized

        /// declare and initialize a variable

        int vacationDays1;
        vacationDays1 = 12;

        // you can both declare and initialize a variable on the same line
        int vacationDays2 = 12;
    }
}
