# Does match
$_ = "yabba dabba doo";
if (/abba/) {                   # put sequence pattern between slash, it applies to the string in $_
  print "It matched!\n";
}

# Won't match
$_ = "yabba dabba doo";
if (/ab ba/) {                  # any whitespace you include in the pattern tries to match
  print "It matched!\n";
}
# Does match
$_ = "yabba dabba doo";
if (/ba da/) {
  print "It matched!\n";
}

# Syntax error
$pattern = "(";                 # a single opening parenthesis is not valid
if (/$pattern/) {
  print "It matched!\n";
}

# Does match every string
$_ = "yabba dabba doo";
if (//) {                       # the empty pattern matches at the beginning of the string where it always finds the sequence of zero characters
  print "It matched!\n";
}

# the pattern in slash is a double-quoted context
# there are many way to match special sequences
# /coke\tsprite/                         \t for tab
# /coke\N{CHARACTER TABULATION}sprite/   \N{charname}
# /coke\011sprite/                       character number, octal
# /coke\x09sprite/                       character number, hex
# /coke\x{9}sprite/                      character number, hex
# /coke${tab}sprite/                     scalar variable
