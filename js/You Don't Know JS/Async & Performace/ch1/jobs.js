/*
   Job queue: is a queue hanging off the end of every tick in the event loop queue
              (other thing to do later beforee anything else can happen)
   a Job can alse cause more Jobs to be added to the end of the same queue
*/

console.log( "A" );

setTimeout( function(){
        console.log( "B" );
}, 0 );

// theoretical "Job API"
schedule( function(){
        console.log( "C" );

        schedule( function(){
                console.log( "D" );
        } );
} );
