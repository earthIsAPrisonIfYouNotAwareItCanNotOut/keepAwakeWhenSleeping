/*
   interaction1
   two concurrent ajax responses and there is no real guarantee of what order the response will arrive back in the browser
*/
var res = [];

function response(data) {
        res.push( data );
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", response );
ajax( "http://some.url.2", response );


/*
   interaction2
   we inpect the data.url to figure out which position the response data should occupy in the res array
   through simple coordination, we eliminated the "race condition" nondeterminism
*/
var res = [];

function response(data) {
        if (data.url == "http://some.url.1") {
                res[0] = data;
        }
        else if (data.url == "http://some.url.2") {
                res[1] = data;
        }
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", response );
ajax( "http://some.url.2", response );


/*
    interaction3
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


/*
   interaction4
   The if (a && b) conditional around the baz() call is traditionally called a "gate," because we're not sure what order a and b will arrive
   but we wait for both of them to get there before we proceed to open the gate (call baz())

*/
var a, b;

function foo(x) {
        a = x * 2;
        if (a && b) {
                baz();
        }
}

function bar(y) {
        b = y * 2;
        if (a && b) {
                baz();
        }
}

function baz() {
        console.log( a + b );
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", foo );
ajax( "http://some.url.2", bar );


/*
   interaction5
   Whichever one (foo() or bar()) fires last will not only overwrite the assigned a value from the other, but it will also duplicate the call to baz() (likely undesired)
*/
var a;

function foo(x) {
        a = x * 2;
        baz();
}

function bar(x) {
        a = x / 2;
        baz();
}

function baz() {
        console.log( a );
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", foo );
ajax( "http://some.url.2", bar );


/*
   interaction6
   The if (a == undefined) conditional allows only the first of foo() or bar() through, and the second (and indeed any subsequent) calls would just be ignored
*/
var a;

function foo(x) {
        if (a == undefined) {
                a = x * 2;
                baz();
        }
}

function bar(x) {
        if (a == undefined) {
                a = x / 2;
                baz();
        }
}

function baz() {
        console.log( a );
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", foo );
ajax( "http://some.url.2", bar );
