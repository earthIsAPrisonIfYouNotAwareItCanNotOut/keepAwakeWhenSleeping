/*
   Chunk 1 is synchronous (happens now), chunks 2 and 3 are asynchronous (happen later)

   Because foo() can't be interrupted by bar(), and bar() can't be interrupted by foo()
   this program only has two possible outcomes depending on which single-threading starts running first (chunk 2 or chunk 3)
*/

// chunk 1
var a = 1;
var b = 2;

// chunk 2
function foo() {
        a++;
        b = b * a;
        a = b + 3;
}

// chunk 3
function bar() {
        b--;
        a = 8 + b;
        b = a * 2;
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", foo );
ajax( "http://some.url.2", bar );
