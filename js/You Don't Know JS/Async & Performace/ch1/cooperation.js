/*
   chunk
   the entire list will be mapped into res all at once
   while such a process is running, nothing else in the page can happen
     including no other response calls, no UI update,
     not even user events like scrolling, typing, button clicking
*/

var res = [];

// `response(..)` receives array of results from the Ajax call
function response(data) {
        // add onto existing `res` array
        res = res.concat(
                // make a new transformed array with all `data` values doubled
                data.map( function(val){
                        return val * 2;
                } )
        );
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", response );
ajax( "http://some.url.2", response );


/*
   schedule
   process the data set in maximum-size chunks of 1000 items
   use the setTimeout for async scheduling, which mean "stick this function at the end of the current event loop queue"
   : Note
   two setTimeout calls would not be strictly guaranteed to be processed in call order
*/

var res2 = [];

// `response(..)` receives array of results from the Ajax call
function response(data) {
        // let's just do 1000 at a time
        var chunk = data.splice( 0, 1000 );

        // add onto existing `res2` array
        res2 = res2.concat(
                // make a new transformed array with all `chunk` values doubled
                chunk.map( function(val){
                        return val * 2;
                } )
        );

        // anything left to process?
        if (data.length > 0) {
                // async schedule next batch
                setTimeout( function(){
                        response( data );
                }, 0 );
        }
}

// ajax(..) is some arbitrary Ajax function given by a library
ajax( "http://some.url.1", response );
ajax( "http://some.url.2", response );
