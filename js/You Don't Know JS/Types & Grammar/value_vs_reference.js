/*
   value-copy
*/

var a = 2;
var b = a; // `b` is always a copy of the value in `a`
b++;
a; // 2
b; // 3

/*
   reference-copy
*/

var c = [1,2,3];
var d = c;          // `d` is a reference to the shared `[1,2,3]` value
d.push( 4 );
c;            // [1,2,3,4]
d;            // [1,2,3,4]

var a = [1,2,3];
var b = a;          // b is not a pointer to a
a;            // [1,2,3]
b;            // [1,2,3]
// later
b = [4,5,6];        // a is still referencing [1,2,3]
a;            // [1,2,3]
b;            // [4,5,6]

/*
   separate reference
*/

function foo(x) {
  x.push(4);
  x;

  x = [4,5,6];
  x.push(7);
  x;
}
var a = [1,2,3];
foo( a );
a; // [1,2,3,4]  not  [4,5,6,7]

/*
   shared reference
*/

function foo(x) {
  x.push(4);
  x;
  x.length = 0;
  x.push( 4, 5, 6, 7 );
  x;
}
var a = [1,2,3];
foo( a );
a; // [4,5,6,7]  not  [1,2,3,4]

// foo( a.slice() ); // foo(..) cannot affect the contents of a
// a; // [1,2,3]
// NOTE:
// slice(..) with no parameters by default
//   makes an entirely new (shallow) copy of the array

/*
   wrapper reference
*/

function foo(wrapper) {
  wrapper.a = 42;
}
var obj = {
  a: 2
};
foo( obj );
obj.a; // 42

/*
   mutable scalar primitive
*/

function foo(x) {
  x = x + 1;
  x; // 3
}
var a = 2;
var b = new Number( a ); // or equivalently `Object(a)`
foo( b );
console.log( b ); // 2, not 3
