/*
   convert an array-like value into a true array
*/
function foo() {
  var arr = Array.prototype.slice.call( arguments );
  // var arr = Array.from( arguments );
  arr.push( "bam" );
  console.log( arr );
}
foo( "bar", "baz" ); // ["bar","baz","bam"]
