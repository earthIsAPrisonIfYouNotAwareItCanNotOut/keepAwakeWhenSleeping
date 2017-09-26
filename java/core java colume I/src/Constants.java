/**
 * Created by sb on 2017/9/5.
 */
public class Constants {
    /// constant variables

    public static final double CM_PER_INCH = 2.54;

    /// class constants

    public static void main(String[] args) {
        double paperWidth = 8.5;
        double paperHeight = 11;
        System.out.println("Paper size in centimeters: "
                + paperWidth * CM_PER_INCH + " by " + paperHeight * CM_PER_INCH);
    }
}
