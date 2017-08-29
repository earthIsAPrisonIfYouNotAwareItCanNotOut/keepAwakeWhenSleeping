/*
   .prototype object
*/

// String#indexOf(..)
//    find the position in the string of another substring
// String#charAt(..)
//    access the character at a position in the string
// String#substr(..) String#substring(..), and String#slice(..):
//    extract a portion of the string as a new string
// String#toUpperCase() and String#toLowerCase():
//    create a new string that's converted to either uppercase or lowercase
// String#trim()
//    create a new string that's stripped of any trailing or leading whitespace

/*
   any string value can access these methods
*/

var a = " abc ";
a.indexOf( "c" ); // 3
a.toUpperCase(); // " ABC "
a.trim(); // "abc"

/*
   Function.prototype being an empty function
*/

typeof Function.prototype;                      // "function"
Function.prototype();                           // it's an empty function!

/*
   RegExp.prototype is a regular expression
*/

RegExp.prototype.toString();                    // "/(?:)/" -- empty regex
"abc".match( RegExp.prototype );                // [""]

/*
   Array.prototype is an array
*/

Array.isArray( Array.prototype );       // true
Array.prototype.push( 1, 2, 3 );        // 3
Array.prototype;                        // [1,2,3]
