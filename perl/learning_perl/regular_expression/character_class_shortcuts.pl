## \s

$_ = "fred  \t \t  barney";
if (/fred\s+barney/) {          # any whitespace
  print "It matched!\n";
}


# \h

$_ = "fred  \t \t  barney";
if (/fred\h+barney/) {          # any whitespace
  print "It matched!\n";
}


## \d

$_ = 'The HAL-9000 requires authorization to continue.';
if (/HAL-\d+/) {
  print "The string mentions some model of HAL computer.\n";
}
