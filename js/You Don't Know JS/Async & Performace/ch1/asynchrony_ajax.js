/*
  standard ajax() requests don't complete synchronously
*/
var data = ajax( "http://some.url.1" );
console.log( data );
// Oops! `data` generally won't have the Ajax results

/*
  use callback function to make an asynchronous ajax()
*/
ajax( "http://some.url.1", function myCallbackFunction(data){
  console.log( data ); // Yay, I gots me some `data`!
} );

/*
  asynchronous ajax() without callback function
*/
function now() {
  return 21;
}
function later() {
  answer = answer * 2;
  console.log( "Meaning of life:", answer );
}
var answer = now();
setTimeout( later, 1000 ); // Meaning of life: 42
// It should be fairly obvious what those two chunks are, but let's be super explicit
// Now:
function now() {
  return 21;
}
function later() { .. }
var answer = now();
setTimeout( later, 1000 );
// Later:
answer = answer * 2;
console.log( "Meaning of life:", answer );
