## scalar interpolation
$name = "Larry Wall";
print "Hello there, $name, did you know that 3+4 is ", 3+4, "?\n";  # , $name,

## array interpolation
print @array;       # 1
print "@array";     # 2

## work with <>
print <>; # implementation of /bin/cat
print sort <>; # implementation of /bin/sort

## optianl parentheses
print("Hello, world!\n");
print "Hello, world!\n";

## function call
print (2+3);           #                             without parentheses around
# ( print(2+3) ) * 4;  # Oops!                       with parentheses around
# print (2+3)*4;       # Oops! tha same as above
print( (2+3) * 4 );
# $result = print("hello world!\n");                 return value
