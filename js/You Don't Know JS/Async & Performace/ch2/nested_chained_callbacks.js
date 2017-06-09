/*
   callback hell

   map this code asynchrony naturally to sequential brain planning
   listen( "..", function handler(..){
           // ..
   } );
   setTimeout( function request(..){
           // ..
   }, 500) ;
   ajax( "..", function response(..){
           // ..
   } );

*/

listen( "click", function handler(evt){
        setTimeout( function request(){
                ajax( "http://some.url.1", function response(text){
                        if (text == "hello") {
                                handler();
                        }
                        else if (text == "world") {
                                request();
                        }
                } );
        }, 500) ;
} );


/*
   trace nested flow

   if A, B and D are async
   A -> B -> C -> D -> E -> F

   if A, B and D aren't actually async
   A -> C -> D -> F -> E -> B
*/

doA( function(){
        doC();

        doD( function(){
                doF();
        } );

        doE();
} );

doB();
