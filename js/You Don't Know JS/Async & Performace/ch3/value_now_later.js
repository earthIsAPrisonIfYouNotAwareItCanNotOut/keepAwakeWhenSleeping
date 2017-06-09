/*
   statement finish now and later
*/

var x, y = 2;

console.log( x + y ); // NaN  <-- because `x` isn't set yet


/*
   handle now and later operations become async
*/

function add(getX,getY,cb) {
        var x, y;
        getX( function(xVal){
                x = xVal;
                // both are ready?
                if (y != undefined) {
                        cb( x + y );    // send along sum
                }
        } );
        getY( function(yVal){
                y = yVal;
                // both are ready?
                if (x != undefined) {
                        cb( x + y );    // send along sum
                }
        } );
}

// `fetchX()` and `fetchY()` are sync or async
// functions
add( fetchX, fetchY, function(sum){
        console.log( sum ); // that was easy, huh?
} );
