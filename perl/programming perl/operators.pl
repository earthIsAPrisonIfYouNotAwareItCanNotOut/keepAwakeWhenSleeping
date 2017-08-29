## mathematical operators

$a + $b
$a * $b
$a % $b
$a ** $b

## string addition

$a = 123;
$b = 456;
say $a + $b;   # prints 579
say $a . $b;   # prints 123456

## string multiply

$a = 123;
$b = 3;
say $a * $b;   # prints 369
say $a x $b;   # prints 123123123

## three ways to concatenation string

say $a . " is equal to " . $b . ".";   # dot operator
say $a, " is equal to ", $b, ".";      # list
say "$a is equal to $b.";              # interpolation

## draw a line across your screen

say "–" x $scrwid;

## get set to

$a = $b;
$a = $b + 5;
$a = $a * 3;

## a shortcut

lvalue operator= expression
# it equals to
lvalue = lvalue operator expression

$line .= "\n";  # Append newline to $line
$fill x= 80;    # Make string $fill into 80 repeats of itsel
$val ||= "2";   # Set $val to 2 if it isn't already "true"

## assignment returns variable as an lvalue

$a = $b = $c = 0;         # left variable as a lvalue

($temp –= 32) *= 5/9;     # left assignment as a lvalue
chop($number = <STDIN>);
