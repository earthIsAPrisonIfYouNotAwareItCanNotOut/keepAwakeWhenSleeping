/*
   the comcept of notification listener
*/

foo(x) {
        // start doing something that could take a while
}

foo( 42 );

on (foo "completion") {
        // now we can do the next step!
}

on (foo "error") {
        // oops, something went wrong in `foo(..)`
}


/*
   achieve in js
*/

function foo(x) {
        // start doing something that could take a while

        // make a `listener` event notification
        // capability to return

        return listener;
}

var evt = foo( 42 );

evt.on( "completion", function(){
        // now we can do the next step!
} );

evt.on( "failure", function(err){
        // oops, something went wrong in `foo(..)`
} );


/*
   the benefit of it
*/

var evt = foo( 42 );

// let `bar(..)` listen to `foo(..)`'s completion
bar( evt );

// also, let `baz(..)` listen to `foo(..)`'s completion
baz( evt );
