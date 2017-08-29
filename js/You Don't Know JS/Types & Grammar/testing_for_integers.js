/*
   Number.isInteger(..)
*/

Number.isInteger( 42 );         // true
Number.isInteger( 42.000 );     // true
Number.isInteger( 42.3 );       // false
if (!Number.isInteger) {        // polyfill Number.isInteger(..) for pre-ES6
  Number.isInteger = function(num) {
    return typeof num == "number" && num % 1 == 0;
  };
}

/*
   Number.isSafeInteger(..)
*/

Number.isSafeInteger( Number.MAX_SAFE_INTEGER );      // true
Number.isSafeInteger( Math.pow( 2, 53 ) );            // false         32-bit safe range
Number.isSafeInteger( Math.pow( 2, 53 ) - 1 );        // true
if (!Number.isSafeInteger) {    // polyfill Number.isSafeInteger(..) in pre-ES6 browsers
  Number.isSafeInteger = function(num) {
    return Number.isInteger( num ) &&
      Math.abs( num ) <= Number.MAX_SAFE_INTEGER;
  };
}
