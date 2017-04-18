/*
  because of defering the console I/O to the background
  console.log will run after a.index++
*/
var a = {
        index: 1
};

// later
console.log( a ); // ?? { index: 2}

// even later
a.index++;
