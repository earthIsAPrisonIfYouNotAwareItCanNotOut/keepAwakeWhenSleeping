/**
 * Created by sb on 2017/9/12.
 */
public class Strings {
    public static void main(String[] args) {
        /// Unicode characters
        // "Java\u2122" consists of the five Unicode characters J, a, v, a, and ™

        /// substrings
        String greeting = "Hello";
        String s = greeting.substring(0, 3); // "Hel"
        /// computing the length of the substring
        // the string s.substring(a, b) always has length b - a

        /// use + join two strings
        String expletive = "Explective";
        String PG13 = "deleted";
        String message = expletive + PG13; // "Expletivedeleted"
        /// the join value is automatically convert to a string
        int age = 13;
        String rating = "PG" +age; // "PG13"
        /// output statements
        // this feature is commonly used in output statements
        System.out.println("The answer is " + rating);
        /// .join method
        String all = String.join(" / ", "S", "M", "L", "XL");
        // all is the string "S / M / L / XL"

        /// strings are immutable
        // if you want to turn greeting into "Help!"
        //   you cannot directly change the last positions of greeting into "P" and "!"
        /// how to change string value and not create new one
        // in java, concatenated the substring
        //   that you want to keep with the characters
        //   that you want to replace
        greeting = greeting.substring(0, 3) + "p!";

        /// testing strings for equality
        // s.equals(t)
        // s and t can be string variables or string literals
        "Hello".equals(greeting);
        /// ignore upper/lower case distinction
        "Hello".equalsIgnoreCase("hello");
        /// do not use the == operator to test whether two string are equal
        if (greeting == "Hello")
        // probably true, if strings are in the same location
        if (greeting.substring(0, 3) == "Hel"){}
        // probably false, it is possible to store multiple copies of identical strings in different places

        /// test whether a string is empty
        // if (str.length() == 0)
        // or
        // if (str.equals(""))
        /// test whether a string is null
        // if (str == null)
        /// test a string is neither null nor empty
        // you need to test that str is not null first
        // if (str != null && str.length() != 0)

        /// return the code units at position n
        char first = greeting.charAt(0); // first is 'H'
        char last = greeting.charAt(4); // last is 'o'
        /// to get ith code point
        // int index = greeting.offsetByCodePoints(0, i);
        // int cp = greeting.codePointAt(index);
        /// to get the character with two code units
        // use _codePoints_ method that yields a "stream" of int values
        //   one for each code point
        //   turn it into an array and traverse that
        // int[] codePoints = str.codePoints().toArray();
        // String str = new String(codePoints, 0, codePoints.length);

        /// construct an empty string builder
        StringBuilder builder = new StringBuilder();
        /// add another part
        builder.append('a'); // appends a single character
        builder.append("str"); // appends a string
        /// get all String sequences contained in builder
        String completedString = builder.toString();
    }
}
