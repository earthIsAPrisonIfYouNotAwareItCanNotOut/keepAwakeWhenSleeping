/**
 * Created by sb on 2017/9/11.
 */
public class Cast {
    public static void main(String[] args) {
        /// information may be lost
        double x = 9.97;
        int nx = (int) x; // 9
        /// round a floating-point number
        int nx2 = (int) Math.round(x); // 10
    }
}
