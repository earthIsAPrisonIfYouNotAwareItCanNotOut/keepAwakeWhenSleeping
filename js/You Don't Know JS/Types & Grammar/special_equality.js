/*
   test for special types
*/

var a = 2 / "foo";
var b = -3 * 0;
Object.is( a, NaN );    // true
Object.is( b, -0 );     // true
Object.is( b, 0 );      // false

/*
   Object.is
*/

if (!Object.is) {
  Object.is = function(v1, v2) {
    // test for `-0`
    if (v1 === 0 && v2 === 0) {
      return 1 / v1 === 1 / v2;
    }
    // test for `NaN`
    if (v1 !== v1) {
      return v2 !== v2;
    }
    // everything else
    return v1 === v2;
  };
}
