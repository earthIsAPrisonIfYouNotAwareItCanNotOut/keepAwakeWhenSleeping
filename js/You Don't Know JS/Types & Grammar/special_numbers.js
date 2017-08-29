/*
   NaN
*/

var a = 2 / "foo";      // NaN
typeof a === "number";  // true

/*
   Number.isNaN
*/

var b = "foo";
window.isNaN( b );      // true -- bug
// this is a bug has been in JS
// as of ES6, you can use Number.isNaN instead
if (!Number.isNaN) {
  Number.isNaN = function(n) {
    return (
      typeof n === "number" &&
        window.isNaN( n )
    );
  };
}
var a = 2 / "foo";
var b = "foo";
Number.isNaN( a ); // true
Number.isNaN( b ); // false -- phew!
