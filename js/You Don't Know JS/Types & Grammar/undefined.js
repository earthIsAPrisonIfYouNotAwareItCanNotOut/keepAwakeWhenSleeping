/*
   undefined identifier
*/

function foo() {
  undefined = 2; // really bad idea!
}
foo();

function foo() {
  "use strict";
  undefined = 2; // TypeError!
}
foo();

// however, you can create a local variable of the name undefined
// But again, this is a terrible idea!
function foo() {
  "use strict";
  var undefined = 2;
  console.log( undefined ); // 2
}
foo();

// TIP: don't let friends override undefined. Ever
