/*
   overly trusting of input
*/

function addNumbers(x,y) {
        // + is overloaded with coercion to also be
        // string concatenation, so this operation
        // isn't strictly safe depending on what's
        // passed in.
        return x + y;
}

addNumbers( 21, 21 );   // 42
addNumbers( 21, "21" ); // "2121"


/*
   defensive against untrusted input
*/

function addNumbers(x,y) {
        // ensure numerical input
        if (typeof x != "number" || typeof y != "number") {
                throw Error( "Bad parameters" );
        }

        // if we get here, + will safely do numeric addition
        return x + y;
}

addNumbers( 21, 21 );   // 42
addNumbers( 21, "21" ); // Error: "Bad parameters"


/*
   perhaps still safe but friendlier
*/

function addNumbers(x,y) {
        // ensure numerical input
        x = Number( x );
        y = Number( y );

        // + will safely do numeric addition
        return x + y;
}

addNumbers( 21, 21 );   // 42
addNumbers( 21, "21" ); // 42
