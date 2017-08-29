## promitive types

<?php
$a_bool = TRUE;   // a boolean
$a_str  = "foo";  // a string
$a_str2 = 'foo';  // a string
$an_int = 12;     // an integer

echo gettype($a_bool); // prints out:  boolean
echo gettype($a_str);  // prints out:  string

// If this is an integer, increment it by four
if (is_int($an_int)) {
    $an_int += 4;
}

// If $a_bool is a string, print it out
// (does not print out anything)
if (is_string($a_bool)) {
    echo "String: $a_bool";
}
?>

<?php
$foo = True; // assign the value TRUE to $foo
?>

<?php
// == is an operator which tests
// equality and returns a boolean
if ($action == "show_version") {
    echo "The version is 1.23";
}
// this is not necessary...
if ($show_separators == TRUE) {
    echo "<hr>\n";
}
// ...because this can be used with exactly the same meaning:
if ($show_separators) {
    echo "<hr>\n";
}
?>

## boolean type

<?php
$foo = True; // assign the value TRUE to $foo
?>

<?php

# typically, the result of an operators
#   which returns a boolean value is passed on to a control structure

// == is an operator which tests
// equality and returns a boolean
if ($action == "show_version") {
    echo "The version is 1.23";
}
// this is not necessary...
if ($show_separators == TRUE) {
    echo "<hr>\n";
}
// ...because this can be used with exactly the same meaning:
if ($show_separators) {
    echo "<hr>\n";
}
?>

## converting to boolean

# when converting to boolean, the following values are considered FALSE

# the boolean FALSE itself
# the integer 0 (zero)
# the float 0.0 (zero)
# the empty string, and the string "0"
# an array with zero elements
# the special type NULL (including unset variables)
# SimpleXML objects created from empty tags

## integer type

# integers can be specified in
#   decimal, hexadecimal, octal or binary notation
#   optionally preceded by a sign (- or +)

<?php
$a = 1234; // decimal number
$a = -123; // a negative number
$a = 0123; // octal number (equivalent to 83 decimal)
$a = 0x1A; // hexadecimal number (equivalent to 26 decimal)
$a = 0b11111111; // binary number (equivalent to 255 decimal)
?>

# warning
# since PHP 7, if an invalid digit was given in an octal integer
#   a parse error is emitted

## integer overflow

# integer overflow on a 32-bit system

<?php
$large_number = 2147483647;
var_dump($large_number);                     // int(2147483647)
$large_number = 2147483648;
var_dump($large_number);                     // float(2147483648)
$million = 1000000;
$large_number =  50000 * $million;
var_dump($large_number);                     // float(50000000000)
?>

# integer overflow on a 64-bit system

<?php
$large_number = 9223372036854775807;
var_dump($large_number);                     // int(9223372036854775807)
$large_number = 9223372036854775808;
var_dump($large_number);                     // float(9.2233720368548E+18)
$million = 1000000;
$large_number =  50000000000000 * $million;
var_dump($large_number);                     // float(5.0E+19)
?>

## converting to integer

# there is no integer division operator in PHP
# the value can be casted to an integer to round it towards zero (舍弃小数部分)
# or the round() function provides finer control over rounding (四舍五入)

<?php
var_dump(25/7);         // float(3.5714285714286)
var_dump((int) (25/7)); // int(3)
var_dump(round(25/7));  // float(4)
?>

# from booleans
# FALSE will yield 0, and TRUE will yield 1

# from floating point numbers
# when converting from float to integer, the number will be rounded towards zero

# NOTE
# as of PHP7, undefined and NaN and infinity
#   will always be zero when casting to integer

# WARNING
# never cast an unknown fraction to integer

<?php
echo (int) ( (0.1+0.7) * 10 ); // echoes 7!
?>

## float type

<?php
$a = 1.234;
$b = 1.2e3;
$c = 7E-10;
?>

## floating point precision

# rational numbers that are exactly representable as
#   floating point numbers in base 10, like 0.1 or 0.7
#   do not have an exact representation as floating point numbers in base 2
#     like floor((0.1+0.7)*10) will usually return 7 instead of the expected 8
#     since the internal representation will be something like 7.999999999999911....

## comparing floats

<?php
$a = 1.23456789;
$b = 1.23456780;
$epsilon = 0.00001;
if(abs($a-$b) < $epsilon) {
    echo "true";
}
?>
