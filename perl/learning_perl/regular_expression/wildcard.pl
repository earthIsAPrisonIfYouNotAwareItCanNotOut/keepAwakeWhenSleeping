## the dot . wildcard
$_ = "yabba dabba doo";
if (/ab.a/) {
  print "It matched!\n";
}

$_ = "yabba dabba doo!";
if (/doo./) {                   # matches
  print "It matched!\n";
}
$_ = "yabba dabba doo\n";
if (/doo./) {                   # doesn't matches
  print "It matched!\n";
}

$_ = "yabba dabba doo.";
if (/doo\./) {                  # matches
  print "It matched!\n";
}

## to match a literal backslash
$_ = 'a real \\ backslash';
if (/\\/) {                     # matches
  print "It matched!\n";
}

## another way to write "any character except a mewline", use \N
$_ = "yabba dabba doo!";
if (/doo\N/) {                  # matches
  print "It matched!\n";
}
$_ = "yabba dabba doo\n";
if (/doo\N/) {                  # doesn't matches
  print "It matched!\n";
}
