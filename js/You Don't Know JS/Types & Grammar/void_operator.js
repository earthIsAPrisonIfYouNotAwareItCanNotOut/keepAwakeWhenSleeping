/*
   hold the undefined value
*/
var a = 42;
console.log( void a, a );  // There's no practical difference between
                           //   void 0, void 1, and undefined
                           // -> undefined 42

/*
   to ensure an expression has no result value
*/

function doSomething() {
  // note: `APP.ready` is provided by our application
  if (!APP.ready) {
    // try again later
    return void setTimeout( doSomething, 100 );

    // which works the same as above but doesn't use the void operator
    // setTimeout( doSomething, 100 );
    // return;
  }
  var result;
  // do some other stuff
  return result;
}

// were we able to do it right away?
if (doSomething()) {
  // handle next tasks right away
}
