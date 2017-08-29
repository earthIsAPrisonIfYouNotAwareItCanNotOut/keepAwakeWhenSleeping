/*
   undefined is a value that a declared variable can hold
*/

typeof a;    // "undefined"
var b = 42;
var c;
b = c;
typeof b;    // "undefined"
typeof c;    // "undefined"

/*
   undeclared means a variable has never been declared
*/

var a;
a; // undefined
b; // undeciared -> ReferenceError: b is not defined
typeof b; // "undefined"  This is a special _safety guard_ in the behavior of typeof
          // safety guard - see typeof_undeclared.js
