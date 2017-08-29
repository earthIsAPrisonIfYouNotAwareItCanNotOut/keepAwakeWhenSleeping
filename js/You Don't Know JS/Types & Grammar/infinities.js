/*
   value Infinity
*/

var a = 1 / 0;  // Infinity
var b = -1 / 0; // -Infinity
var a = Number.MAX_VALUE;       // 1.7976931348623157e+308
a + a;                          // Infinity
a + Math.pow( 2, 970 );         // Infinity
a + Math.pow( 2, 969 );         // 1.7976931348623157e+308
