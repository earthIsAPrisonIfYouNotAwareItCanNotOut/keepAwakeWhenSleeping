## \A

if ( /\Ahttps?:/ ) {
  print "Found a URL\n";
}


## \z
if ( /\.png\z/ ) {
  print "Found a URL\n";
}


## \Z
while (<STDIN>) {
  print if /\.png\Z/;
}

# the same as above, but you have to think about the newline
while (<STDIN>) {
  chomp;
  print "$_\n" if /\.png\z/;  # remove newline before the match and put it back on for output
}
