## or

foreach ( qw(fred betty barney dino) ) {
  if ( /fred|barney/ ) {
    print "$_ matched\n";
  }
}

# fred
# barney


foreach ( qw(fred betty barney dino) ) {
  if ( /fred|barney|betty/ ) {
    print "$_ matched\n";
  }
}

# fred
# betty
# barney


## parentheses

# the alternation divides the pattern into sides, which might not be what you want
# you want to match one of Flintstones, but you don't care if it's Fred or Wilma

# the wrong version
$_ = "Fred Rubble";
if ( /Fred|Wilma Flintstone/ ) { # unexpectedly matches
  print "It matched!\n";
}

# the correct version
$_ = "Fred Rubble";
if ( /(Fred|Wilma) Flintstone/ ) { # doesn't match
  print "It matched!\n";
}


## +

# a string mix of tabs and spaces, to get one or more of those use + quantifier
$_ = "fred  \t \t  barney";     # could be tabs, spaces, or both
if (/fred( |\t)+barney/) {
  print "It matched!\n";
}

# applying the quantifier to each item inside the alternation
$_ = "fred  \t \t  barney";     # could be tabs, spaces, or both
if (/fred( +|\t+)barney/) {     # all tabs or all spaces
  print "It matched!\n";
}

# the pattern without the parentheses
$_ = "fred  \t \t  wilma";
if (/fred |\tbarney/) {
  print "It matched!\n";
}


## case_insensitive

$_ = "Bamm-Bamm";
if (/Bamm-?(B|b)amm/) {
  print "The string has Bamm-Bamm\n";
}
