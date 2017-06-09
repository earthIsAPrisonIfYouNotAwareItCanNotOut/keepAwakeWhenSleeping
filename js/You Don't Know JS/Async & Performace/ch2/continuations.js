/*
   A and B represent the first half of the program (aka the now)
   and C marks the second half of the program (aka the later)

   the first half executes right away, then there's a "pause"
   at some future moment, if the ajax call completes,
      then the program will pick up where it left off, and continue with the second half
*/

// A
ajax( "..", function(..){
        // C
} );
// B


/*
   Do A, setup the timeout for 1000 milliseconds, then do B, then after the timeout fires, do C
*/

// A
setTimeout( function(){
        // C
}, 1000 );
// B
