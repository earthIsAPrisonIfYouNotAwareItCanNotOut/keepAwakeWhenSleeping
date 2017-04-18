# each Unicode property has a name
# to match a particular property, put the name in \p{PROPERTY}

# to match any sort of space, use \p{Space} (the same as \s)
if (/\p{Space}/) {         # 25 different possible characters in v5.24
  print "The string has some whitespace.\n";
}

# if you want to match a digit, use Digit property (the same as \d)
if (/\p{Digit}/) {         # 550 different possible characters in v5.24
  print "The string has a digit.\n";
}

# matching two hex digits
if (/\p{AHex}\p{AHex}/) {       # 22 different possible characters
  print "The string has a pair of hex digits.\n";
}

# use P to nagate the property
if (/\P{Space}/) {              # Not space (many many characters!)
  print "The string has one or more nonwhitespace characters.\n";
}
