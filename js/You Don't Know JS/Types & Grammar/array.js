/*
   the notice of array
*/

var a = new Array( 1, 2, 3 );
a; // [1, 2, 3]
var b = [1, 2, 3];
b; // [1, 2, 3]

/*
   pass length argument to array
*/

var a = new Array( 3 );
a.length; // 3
a; // chrome  report [undefined, undefined, undefined]
   // firefox report [, , ,]
