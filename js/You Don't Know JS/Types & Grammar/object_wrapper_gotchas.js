/*
   manually box a primitive value
*/

var a = new Boolean( false );
if (!a) {
        console.log( "Oops" ); // never runs
}

var a = "abc";
var b = new String( a );
var c = Object( a );
typeof a; // "string"
typeof b; // "object"
typeof c; // "object"
b instanceof String; // true
c instanceof String; // true
Object.prototype.toString.call( b ); // "[object String]"
Object.prototype.toString.call( c ); // "[object String]"
