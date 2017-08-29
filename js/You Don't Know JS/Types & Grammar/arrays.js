/*
   as compared to other type-enforced languages
*/

var a = [ 1, "2", [3] ];
a.length;               // 3
a[0] === 1;             // true
a[2][0] === 3;          // true

/*
   presize your arrays
*/

var a = [ ];
a.length;       // 0
a[0] = 1;
a[1] = "2";
a[2] = [ 3 ];
a.length;       // 3

/*
   remove the slot
*/

a[0] = 1;       // no `a[1]` slot set here
a[2] = [ 3 ];
a[1];           // undefined
                // it will not behave the same
                //   as if the slot is explicitly set (a[1] = undefined)
a.length;       // 3

/*
   add string keys/properties to array
*/
var a = [ ];
a[0] = 1;
a["foobar"] = 2;
a.length;               // 1
a["foobar"];    // 2
a.foobar;               // 2

/*
   the coerced value of key
*/

var a = [ ];
a["13"] = 42;
a.length; // 14
