/*
   native constructor
*/

Object.prototype.toString.call( [1,2,3] );              // "[object Array]"
Object.prototype.toString.call( /regex-literal/i );     // "[object RegExp]"
Object.prototype.toString.call( null );                 // "[object Null]"
Object.prototype.toString.call( undefined );    // "[object Undefined]"
Object.prototype.toString.call( "abc" );        // "[object String]"
Object.prototype.toString.call( 42 );           // "[object Number]"
Object.prototype.toString.call( true );         // "[object Boolean]"
