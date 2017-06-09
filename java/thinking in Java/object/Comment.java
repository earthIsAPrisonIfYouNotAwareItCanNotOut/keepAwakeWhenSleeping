// comment

/* This is a comment
 * that continues
 * across lines
 */

/* This is a comment that
   continues across lines */

// This is a one-line comment


// javadoc

/** A class comment */
public class Documentation1 {
  /** A field comment */
  public int i;
  /** A method comment */
  public void f() {}
} ///:~

// embedded html

/**
* <pre>
* System.out.println(new Date());
* </pre>
*/ ///:~

/**
* You can <em>even</em> insert a list:
* <ol>
* <li> Item one
* <li> Item two
* <li> Item three
* </ol>
*/
///:~


// tags

/**
 * @see classname    refer to the documentation in other classes
 * @link package.class#member label    hyperlink text
 * @version version-information
 * @author author-information
 * @since JDK-version
 * @param parameter-name description
 * @return description
 * @throws fully-qualified-class-name description
 * @deprecated indicate features that were superseded by an imprived feature
 */


// example

import java.util.*;
/** The first Thinking in Java example program.
 * Displays a string and today’s date.
 * @author Bruce Eckel
 * @author www.MindView.net
 * @version 4.0
*/
public class HelloDate {
  /** Entry point to class & application.
   * @param args array of string arguments
   * @throws exceptions No exceptions thrown
  */
  public static void main(String[] args) {
    System.out.println("Hello, it’s: ");
    System.out.println(new Date());
  }
} /* Output: (55% match)
Hello, it’s:
Wed Oct 05 14:39:36 MDT 2005
*///:~
