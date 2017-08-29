/*
   Data() and Error() native constructors
*/

if (!Date.now) {
  Date.now = function(){
    return (new Date()).getTime();
  };
}

/*
   call Date() without new
*/

function foo(x) {
  if (!x) {
    throw new Error( "x wasn't provided" );
  }
  // ..
}
