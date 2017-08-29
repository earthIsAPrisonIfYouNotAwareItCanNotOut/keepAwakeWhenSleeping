/*
   object
*/

typeof { life: 42 }  === "object";    // true

/*
   null
*/

// null is the only primitive value that is "falsy"
// but that also returns "object" from the typeof check
typeof null === "object";   // true

/*
   function
*/

// a function is referred to an object type
//   that has an internal property
//   that allows it to be invoked
typeof function a(){ /* .. */ } === "function"; // true
function a(b,c) {
  /* .. */
}
a.length; // 2

/*
   array
*/

// It's a "subtype" of object
//   and maintaining an automatically updated .length property
typeof [1,2,3] === "object"; // true

/*
   undefined
*/

typeof undefined === "undefined";   // true

/*
   boolean
*/

typeof true === "boolean";   // true

/*
   number
*/

typeof 42 === "number";    // true

/*
   symbol
*/

typeof Symbol() === "symbol";    // true
