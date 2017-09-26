/**
 * Created by sb on 2017/9/11.
 */
public class EnumeratedTypes {
    public static void main(String[] args) {
        // pizza in four sizes
        // 1, 2, 3, 4
        // it is too easy for a wrong size to value 0
        // you can define your own enumerated type
        Size s = Size.MEDIUM;
    }
}
enum Size {SMALL, MEDIUM, LARGE};
