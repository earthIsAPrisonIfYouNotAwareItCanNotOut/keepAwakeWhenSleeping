/*
   object wrapper change automatically
*/

var a = new String( "abc" );
var b = a + ""; // `b` has the unboxed primitive value "abc"
typeof a; // "object"
typeof b; // "string"

/*
   valueOf()
*/

var a = new String( "abc" );
var b = new Number( 42 );
var c = new Boolean( true );
a.valueOf(); // "abc"
b.valueOf(); // 42
c.valueOf(); // true
