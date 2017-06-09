/*
   a single event loop queue: combine with many low-level operations
*/
function later() {
        answer = answer * 2;
        console.log( "Meaning of life:", answer );
}

/*
   a single-thread: sharing the same data executed in parallel
*/
var a = 20;

function foo() {
        a = a + 1;
}

function bar() {
        a = a * 2;
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", foo );
ajax( "http://some.url.2", bar );

// NOTE: if foo() runs before bar(), the result is that a has 42, but if bar() runs before foo() the result in a will be 41
// TIP: threaded programming is very tricky, you should take special steps to prevent this kind of interruption/interleaving from happening
