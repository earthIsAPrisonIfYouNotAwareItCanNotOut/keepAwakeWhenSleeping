/*
   JSON.stringify()
*/

JSON.stringify( 42 );   // "42"
JSON.stringify( "42" ); // ""42"" (a string with a quoted string value in it)
JSON.stringify( null ); // "null"
JSON.stringify( true ); // "true"

// except it will automatically omit JSON-unsafe object
JSON.stringify( undefined );                    // undefined
JSON.stringify( function(){} );                 // undefined
JSON.stringify( [1,undefined,function(){},4] ); // "[1,null,null,4]"
JSON.stringify( { a:2, b:function(){} } );      // "{"a":2}"

/*
   toJSON()
*/

/*
   JSON.stringify() an object with circular reference
*/

var o = { };
var a = {
  b: 42,
  c: o,
  d: function(){}
};
// create a circular reference inside `a`
o.e = a;

// would throw an error on the circular reference
// JSON.stringify( a );

/*
   define a custom JSON value serialization
*/

a.toJSON = function() {
  // only include the `b` property for serialization
  return { b: this.b };
};
JSON.stringify( a ); // "{"b":42}"

/*
   not a JSON string
*/

var a = {
  val: [1,2,3],

  // probably correct!
  toJSON: function(){
    return this.val.slice( 1 );
  }
};

var b = {
  val: [1,2,3],

  // probably incorrect!
  toJSON: function(){
    return "[" +
      this.val.slice( 1 ).join() +
      "]";
  }
};

JSON.stringify( a ); // "[2,3]"

JSON.stringify( b ); // ""[2,3]""

/*
   replacer
*/

var a = {
  b: 42,
  c: "42",
  d: [1,2,3]
};
JSON.stringify( a, ["b","c"] ); // "{"b":42,"c":"42"}"
JSON.stringify( a, function(k,v){
  if (k !== "c") return v;
} );
// "{"b":42,"d":[1,2,3]}"


/*
   space
*/

var a = {
  b: 42,
  c: "42",
  d: [1,2,3]
};

JSON.stringify( a, null, 3 );  // three space indentation
// "{
//    "b": 42,
//    "c": "42",
//    "d": [
//       1,
//       2,
//       3
//    ]
// }"

JSON.stringify( a, null, "-----" );  // four '-' indentation
// "{
// -----"b": 42,
// -----"c": "42",
// -----"d": [
// ----------1,
// ----------2,
// ----------3
// -----]
// }"
