/*
  use in debug
*/

// oops, this would throw an error!
if (DEBUG) {
  console.log( "Debugging is starting" );
}

// this is a safe existence check
if (typeof DEBUG !== "undefined") {
  console.log( "Debugging is starting" );
}

/*
   doing a feature check
*/

if (typeof atob === "undefined") {
  atob = function() { /*..*/ };
}

function doSomethingCool() {
  var helper =
      (typeof FeatureXYZ !== "undefined") ?
      FeatureXYZ :
      function() { /*.. default feature ..*/ };
  var val = helper();
  // ..
}

(function(){
  function FeatureXYZ() { /*.. my XYZ feature ..*/ }
  // include `doSomethingCool(..)`
  function doSomethingCool() {
    var helper =
        (typeof FeatureXYZ !== "undefined") ?
      FeatureXYZ :
      function() { /*.. default feature ..*/ };
    var val = helper();
    // ..
  }
  doSomethingCool();
})();

// dependency injection
function doSomethingCool(FeatureXYZ) {
  var helper = FeatureXYZ ||
      function() { /*.. default feature ..*/ };
  var val = helper();
  // ..
}

/*
   Another way of using global variable instead the safety guard
*/

if (window.DEBUG) {  // debug-enable
    // ..
}

if (!window.atob) {  // feature-check
    // ..
}
