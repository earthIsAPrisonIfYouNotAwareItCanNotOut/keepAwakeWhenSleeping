/*
   custom property names on object
*/

// To use predefined symbols
obj[Symbol.iterator] = function(){ /*..*/ };

// To define your own custom symbols, use the Symbol(..) native
var mysym = Symbol( "my own symbol" );
mysym;                // Symbol(my own symbol)
mysym.toString();     // "Symbol(my own symbol)"
typeof mysym;         // "symbol"
var a = { };
a[mysym] = "foobar";
Object.getOwnPropertySymbols( a ); // [ Symbol(my own symbol) ]
