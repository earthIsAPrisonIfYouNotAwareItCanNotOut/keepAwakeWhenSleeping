/*
  your program is generally broken up into lots of small chunks, which happen one after the other in the event loop queue.
  And technically, other events not related directly to your program can be interleaved within the queue as well.
*/

// `eventLoop` is an array that acts as a queue (first-in, first-out)
var eventLoop = [ ];
var event;

// keep going "forever"
while (true) {
        // perform a "tick"
        if (eventLoop.length > 0) {
                // get the next event in the queue
                event = eventLoop.shift();

                // now, execute the next event
                try {
                        event();
                }
                catch (err) {
                        reportError(err);
                }
        }
}
