var res = {};

function foo(results) {
        res.foo = results;
}

function bar(results) {
        res.bar = results;
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", foo );
ajax( "http://some.url.2", bar );
