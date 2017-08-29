/*
   decimal literal
*/
var a = 42;
var b = 42.3;

/*
   optinal of leading 0
*/

var a = 0.42;
var b = .42;

/*
   omit the extra 0
*/
var a = 42.300;
var b = 42.0;
a; // 42.3
b; // 42

/*
   exponent form
*/

var a = 5E10;
a;                      // 50000000000
a.toExponential();      // "5e+10"
var b = a * a;
b;                      // 2.5e+21
var c = 1 / a;
c;                      // 2e-11
var onethousand = 1E3;                          // means 1 * 10^3
var onemilliononehundredthousand = 1.1E6;       // means 1.1 * 10^6

/*
   Number.prototype
*/

a.toFixed( 0 );     // "43"     NOTE: output is a string
a.toFixed( 1 );     // "42.6"
a.toFixed( 2 );     // "42.59"
a.toFixed( 3 );     // "42.590"

a.toPrecision( 1 ); // "4e+1"   NOTE: output is a string
a.toPrecision( 2 ); // "43"
a.toPrecision( 3 ); // "42.6"
a.toPrecision( 4 ); // "42.59"
a.toPrecision( 5 ); // "42.590"
a.toPrecision( 6 ); // "42.5900"

42.toFixed( 3 );    // SyntaxError
(42).toFixed( 3 );  // "42.000"
42..toFixed( 3 );   // "42.000"
42 .toFixed(3);     // "42.000"

/*
   hexadecimal
*/

0xf3; // hexadecimal for: 243
0Xf3; // ditto

/*
   octal
*/

0363; // octal for: 243
0o363;          // octal for: 243
0O363;          // ditto

/*
   binary
*/

0b11110011;     // binary for: 243
0B11110011;     // ditto

/*
   the representations in binary floating-point
*/

0.1 + 0.2 === 0.3; // false

/*
   Number.EPSILON
*/

// Number.EPSILON = Math.pow(2,-52);
function numbersCloseEnoughToEqual(n1,n2) {
  return Math.abs( n1 - n2 ) < Number.EPSILON;
}
var a = 0.1 + 0.2;
var b = 0.3;
numbersCloseEnoughToEqual( a, b );                      // true
numbersCloseEnoughToEqual( 0.0000001, 0.0000002 );      // false
