/*
   inversion of control
   A and B happen now, under the direct control of the main JS program
   C gets deferred to happen later, and under control of another party
*/

// A
ajax( "..", function(..){
        // C
} );
// B
