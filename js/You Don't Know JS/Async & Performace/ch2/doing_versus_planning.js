/*
   syn
   these three assignment statements are synchronous
   so x = y waits for z = x to finish
   and y = z in turn waits for x = y to finish
*/

// swap `x` and `y` (via temp variable `z`)
z = x;
x = y;
y = z;


/*
   asyn
   it is not multitasking, it's just fast context switching

   as below:
   go to the store
   on the way I'll get a call
   while start talking, I'll be looking up the store

   it's difficult for developers to write async evented code
*/
