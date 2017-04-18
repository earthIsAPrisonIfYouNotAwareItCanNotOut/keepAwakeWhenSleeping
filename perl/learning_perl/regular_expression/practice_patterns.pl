while ( <STDIN> ) {
  chomp;
  if ( /PATTERN_GOES_HERE/ ) {    # you should replace the PATTERN_GOES_HERE with the pattern you'd like to test
    print "\tMatches\n";
  } else {
    print "\tDoesn't match\n";
  }
}
# test for fred
while ( <STDIN> ) {
  chomp;
  if ( /fred/ ) {
    print "\tMatches\n";
  } else {
    print "\tDoesn't match\n";
  }
}
# run this program
# $ perl try_a_pattern
#   Capitalized Fred should not match
#     Doesn't match
#   Lowercase fred should match
#     Matches

# a slightly hazardous way to program since that argument could be anything and Perl has regex features to execute arbitrary code
while ( <STDIN> ) {
  chomp;
  if ( /$ARGV[0]/ ) {           # May be hazardous for your health
    print "\tMatches\n";
  } else {
    print "\tDoesn't match\n";
  }
}
# you can run it with a different pattern without change ing the program
# $ perl try_a_pattern "fred"
#   This will match fred
#     Matches
#   But not Barney
#     Doesn't match
# $ perl try_a_pattern "barney"
#   This will match fred (not)
#     Doesn't match
#   But it will match barney
#     Matches
