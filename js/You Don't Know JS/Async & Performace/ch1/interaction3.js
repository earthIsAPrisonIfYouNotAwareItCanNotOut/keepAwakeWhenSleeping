/*
    whether foo() or bar() fires first, it will always cause baz() to run too early (either a or b will still be undefined)
    but the second invocation of baz() will work, as both a and b will be available
*/
var a, b;

function foo(x) {
        a = x * 2;
        baz();
}

function bar(y) {
        b = y * 2;
        baz();
}

function baz() {
        console.log(a + b);
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", foo );
ajax( "http://some.url.2", bar );
