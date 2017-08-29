/*
   array-like
*/

var a = "foo";           // string
var b = ["f","o","o"];   // array

/*
   length property
*/

a.length;                // 3
b.length;                // 3
a.indexOf( "o" );        // 1
b.indexOf( "o" );        // 1
var c = a.concat( "bar" );              // "foobar"
var d = b.concat( ["b","a","r"] );      // ["f","o","o","b","a","r"]
a === c;                 // false
b === d;                 // false
a;                       // "foo"
b;                       // ["f","o","o"]
a[1] = "O";              // NOTE: the string a[1] character position
                         //       access form was not always widely valid JavaScript
                         //       Instead, the correct approach has been a.charAt(1)
b[1] = "O";
a;                       // "foo"
b;                       // ["f","O","o"]

/*
   immutable
*/

c = a.toUpperCase();
a === c;                // false
a;                      // "foo"
c;                      // "FOO"
b.push( "!" );
b;                      // ["f","O","o","!"]

/*
   some array method are not available for string
*/

a.join;                         // undefined
a.map;                          // undefined
var c = Array.prototype.join.call( a, "-" );
var d = Array.prototype.map.call( a, function(v){
  return v.toUpperCase() + ".";
} ).join( "" );
c;                              // "f-o-o"
d;                              // "F.O.O."

/*
   the array reverse method when string not have
*/

a.reverse;      // undefined
b.reverse();    // ["!","o","O","f"]
b;              // ["!","o","O","f"]
Array.prototype.reverse.call( a );   // still return a string "foo" :(

/*
   another workaround is to convert the string into an array
*/

var c = a
// split `a` into an array of characters
  .split( "" )
// reverse the array of characters
  .reverse()
// join the array of characters back to a string
  .join( "" );
c; // "oof"
