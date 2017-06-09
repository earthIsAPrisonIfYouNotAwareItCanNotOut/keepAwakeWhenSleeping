## ?

$_ = 'Bamm-bamm';
if (/Bamm-?bamm/) {         # the preceding item - is optional
  print "It matched!\n";
}

# % perl try_a_pattern "Bamm-?bamm"
#   Bamm-bamm
#   Matches
#   Bammbamm
#   Matches
#   Are you Bammbamm or Bamm-bamm?
#   Matches


## *

$_ = 'Bamm-----bamm';
if (/Bamm-*bamm/) {
  print "It matched!\n";
}

$_ = 'Bamm      bamm';
if (/Bamm *bamm/) {
  print "It matched!\n";
}

# the .* can match zero or more of any character except the newline
$_ = 'Bamm      bamm';
if (/B.*m/) {
  print "It matched!\n";
}

# since the .* can match zero character, below three if conditions are the same
$_ = 'Bamm      bamm';
if (/B.*/) {
  print "It matched!\n";
}
if (/.*B/) {
  print "It matched!\n";
}
$_ = 'Bamm      bamm';
if (/B/) {
  print "It matched!\n";
}


## +

$_ = 'Bamm      bamm';
if (/Bamm +bamm/) {
  print "It matched!\n";
}


## number
$_ = "yabbbba dabbba doo.";
if (/ab{3}a/) {
  print "It matched!\n";
}

# it can match yabbbba if the quantifier is at the end of the pattern
$_ = "yabbbba dabbba doo.";
if (/ab{3}/) {
  print "It matched!\n";
}
$_ = "yabbbba dabbba doo.";

# put the minimum and maximum times to repeat
if (/ab{2,3}a/) {
  print "It matched!\n";
}

# the leftmost match
$_ = "yabbbba dabbba doo.";
if (/ab{3,}a/) {
  print "It matched!\n";
}
