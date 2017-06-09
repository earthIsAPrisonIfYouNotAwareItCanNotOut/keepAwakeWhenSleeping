## $&, $`, $'

## $&

if ("Hello there, neighbor" =~ /\s(\w+),/) {
  print "That actually matched '$&'.\n"; # " there,"
}

## $`, $'

if ("Hello there, neighbor" =~ /\s(\w+),/) {
  print "That was ($`)($&)($').\n"; # (Hello)( there,)( neighbor)
}


## ${^PREMATCH} ${^MATCH} ${^POSTMATCH}

use v5.10;
if ("Hello there, neighbor" =~ /\s(\w+),/p) {
  print "That actually matched '${^MATCH}'.\n";
}
if ("Hello there, neighbor" =~ /\s(\w+),/p) {
  print "That was (${^PREMATCH})(${^MATCH})(${^POSTMATCH}).\n";
}
