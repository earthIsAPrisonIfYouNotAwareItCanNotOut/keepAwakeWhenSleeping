# s/search_string/replace_string
#   if the search_string is not find, the original string is untouched
$_ = "He's out bowling with Barney tonight.";
s/Barney/Fred/;    # Replace Barney with Fred
s/Wilma/Betty/;    # Replace Wilma with Betty (fails)

# the replacement string uses the first capture variable, $1
#   which is set by the pattern match
$_ = "He's out bowling with Barney tonight.";
s/with (\w+)/against $1's team/;
print "$_\n";   # says "He's out bowling against Fred's team tonight."

# some example would not be typical in real world
$_ = "green scaly dinosaur";
s/(\w+) (\w+)/$2, $1/;  # Now it's "scaly, green dinosaur"
s/\A/huge, /;           # Now it's "huge, scaly, green dinosaur"
s/,.*een//;             # Empty replacement: Now it's "huge dinosaur"
s/green/red/;           # Failed match: still "huge dinosaur"
s/\w+$/($`!)$&/;        # Now it's "huge (huge !)dinosaur"
s/\s+(!\W+)/$1 /;       # Now it's "huge (huge!) dinosaur"
s/huge/gigantic/;       # Now it's "gigantic (huge!) dinosaur"

# return boolean
$_ = "fred flintstone";
if (s/fred/wilma/) {
  print "Successfully replaced fred with wilma!\n";
}
