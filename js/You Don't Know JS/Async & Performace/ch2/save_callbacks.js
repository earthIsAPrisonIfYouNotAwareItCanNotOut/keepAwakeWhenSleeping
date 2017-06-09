/*
   split-callback design
*/

function success(data) {
        console.log( data );
}

function failure(err) {
        console.error( err );
}

ajax( "http://some.url.1", success, failure );


/*
   Node style
*/

function response(err,data) {
        // error?
        if (err) {
                console.error( err );
        }
        // otherwise, assume success
        else {
                console.log( data );
        }
}

ajax( "http://some.url.1", response );


/*
   cancel the callback event
*/

function timeoutify(fn,delay) {
        var intv = setTimeout( function(){
                        intv = null;
                        fn( new Error( "Timeout!" ) );
                }, delay )
        ;

        return function() {
                // timeout hasn't happened yet?
                if (intv) {
                        clearTimeout( intv );
                        fn.apply( this, [ null ].concat( [].slice.call( arguments ) ) );
                }
        };
}

// using "error-first style" callback design
function foo(err,data) {
        if (err) {
                console.error( err );
        }
        else {
                console.log( data );
        }
}

ajax( "http://some.url.1", timeoutify( foo, 500 ) );



/*
   sync or async
*/

function result(data) {
        console.log( a );
}

var a = 0;

ajax( "..pre-cached-url..", result );
a++;


/*
   proof-of-concept always execute async
*/

function asyncify(fn) {
        var orig_fn = fn,
                intv = setTimeout( function(){
                        intv = null;
                        if (fn) fn();
                }, 0 )
        ;

        fn = null;

        return function() {
                // firing too quickly, before `intv` timer has fired to
                // indicate async turn has passed?
                if (intv) {
                        fn = orig_fn.bind.apply(
                                orig_fn,
                                // add the wrapper's `this` to the `bind(..)`
                                // call parameters, as well as currying any
                                // passed in parameters
                                [this].concat( [].slice.call( arguments ) )
                        );
                }
                // already async
                else {
                        // invoke original function
                        orig_fn.apply( this, arguments );
                }
        };
}

function result(data) {
        console.log( a );
}

var a = 0;

ajax( "..pre-cached-url..", asyncify( result ) );
a++;
