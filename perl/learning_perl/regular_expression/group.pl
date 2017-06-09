## group

# /fred+/      matches freddddddd
# /(fred)+/    matches fredfredfred


## back_reference

# the number denotes the capture group
$_ = "abba";
if (/(.)\1/) {                  # matches 'bb'
  print "It matched same character next to itself!\n";
}

$_ = "yabba dabba doo";
if (/y(....) d\1/) {
  print "It matched the same after y and d!\n";
}

$_ = "yabba dabba doo";
if (/y(.)(.)\2\1/) {            # matches 'abba'
  print "It matched after the y!\n";
}

# (       first parenthesis  \1
#   (.)   second parenthesis \2
#   (.)   third parenthesis  \3
# )

$_ = "yabba dabba doo";
if (/y((.)(.)\3\2) d\1/) {
  print "It matched!\n";
}

# Ambiguous back reference
$_ = "aa11bb";
if (/(.)\111/) {             # \1, \11 or \111?
  print "It matched!\n";
}

# by using \g{N} to disambiguate the back reference
# N is the numbe of the back reference that you want to use
use v5.10;
$_ = "aa11bb";
if (/(.)\g{1}11/) {
  print "It matched!\n";
}

# specify a relative back reference
use v5.10;
$_ = "aa11bb";
if (/(.)\g{-1}11/) {
  print "It matched!\n";
}

# the same as above
use v5.10;
$_ = "xaa11bb";
if (/(.)(.)\g{-1}11/) {
  print "It matched!\n";
}
