## /i

print "Would you like to play a game? ";
chomp($_ = <STDIN>);
if (/yes/i) {                   # case-insensitive match
  print "In that case, I recommend that you go bowling.\n";
}


## /s

$_ = "I saw Barney\ndown at the bowling alley\nwith Fred\nlast night.\n";
if (/Barney.*Fred/s) {
  print "That string mentions Fred after Barney!\n";
}


## /x

# make pattern readable
# /-?[0-9]+\.?[0-9]*/             # what is this doing?
# / -? [0-9]+ \.? [0-9]* /x       # a little better

# NOTE
# perl considers comments a type of whitespace
# so you can put comments into that pattern to tell other people what you to do
# /
#   -?                    # an optional minus sign
#   [0-9]+                # one or more digits before the decimal point
#   \.?                   # an optional decimal point
#   [0-9]*                # some optional digits after the decimal point
# /x

# use literal pound, escape character \# or the character class [#]
# /
#   [0-9]+                # one or more digits before the decimal point
#   [#]                   # literal pound sign
# /x

# be careful not to include the closing delimiter inside the comments
# or it will prematurely terminate the pattern
# /
#   -?                   # with / without -  <--- OOPS!
#   [0-9]+               # one or more digits before the decimal point
#   \.?                  # an optional decimal point
#   [0-9]*               # some optional digits after the decimal point
# /x


## combining modifiers

if (/barney.*fred/is) {  # both /i and /s
      print "That string mentions Fred after Barney!\n";
}

# more expanded version with comments
if (m{
       barney # the little guy
       .*
       fred }six) {
  # anything in between
  # the loud guy
  # all three of /s and /i and /x
  print "That string mentions Fred after Barney!\n";
}


## choose interpretation

# use v5.14;
# /\w+/a   # A-Z, a-z, 0-9, _
# /\w+/u   # any Unicode word charcter
# /\w+/l   # The ASCII version, and word chars from the locale,
#          # perhaps characters like Œ from Latin-9


## case-folding

# /k/aai   # only matches the ASCII K or k, not Kelvin sign
# /k/aia   # the same as above, the /a's don't need to be next to each other
# /ss/aai  # only matches ASCII ss, SS, sS, Ss, not ß
# /ff/aai  # only matches ASCII ff, FF, fF, Ff, not ff


# locale or Unicode

$_ = <STDIN>;
my $OE = chr( 0xBC );           # get exactly what we intend
if (/$OE/i) {                   # case-insensitive? Maybe not.
  print "Found $OE\n";
}

use v5.14;
my $OE1 = chr( 0xBC );           # get exactly what we intend
$_ = <STDIN>;
if (/$OE1/li) {                  # that's better
  print "Found $OE\n";
}

use v5.14;
$_ = <STDIN>;
if (/Œ/ui) {                     # now uses Unicode
  print "Found Œ\n";
}


## match string at the end or begin of line

$_ = 'This is a wilma line
    barney is on another line
    but this ends in fred
    and a final dino line';

# /m
# /fred$/m           # end of line
# /^barney/m         # begin of line


## bind the default pattern

my $some_other = "I dream of betty rubble.";
if ($some_other =~ /\brub/) { # right pattern left string
  print "Aye, there's the rub.\n";
}

# set a boolean
print "Do you like Perl? ";
my $likes_perl = (<STDIN> =~ /\byes\b/i); # 1
# ...Time passes...
if ($likes_perl) {
  print "You said earlier that you like Perl, so...\n";
  ...
}

# the same as 1
# my $likes_perl = <STDIN> =~ /\byes\b/i;    high precedence


## parentheses capture

$_ = "Hello there, neighbor";
if (/\s([a-zA-Z]+),/) {     # capture the word between space and comma
  print "the word was $1\n";    # the word was there
}

$_ = "Hello there, neighbor";
if (/(\S+) (\S+), (\S+)/) {
  print "words were $1 $2 $3\n"; # words were Hello there neighbor
}

my $dino = "I fear that I'll be extinct after 1000 years.";
if ($dino =~ /([0-9]*) years/) {
  print "That said '$1' years.\n"; # $1 is 1000
}
$dino = "I fear that I'll be extinct after a few million years.";
if ($dino =~ /([0-9]*) years/) {
  print "That said '$1' years.\n"; # $1 is empty string
}


## persistence captures

# not match
my $wilma = '123';
$wilma =~ /([0-9]+)/;           # Succeeds, $1 is 123
$wilma =~ /([a-zA-Z]+)/;        # BAD! Untested match result
print "Wilma's word was $1... or was it?\n"; # Still 123!

# match
if ($wilma =~ /([a-zA-Z]+)/) {
  print "Wilma's word was $1.\n";
} else {
  print "Wilma doesn't have a word.\n";
}

if ($wilma =~ /([a-zA-Z]+)/) {
  my $wilma_word = $1;
  ...
}


## noncapture

if (/(bronto)?saurus (steak|burger)/) {
  print "Fred wants a $2\n";
}

if (/(?:bronto)?saurus (steak|burger)/) {
  print "Fred wants a $1\n";
}

if (/(?:bronto)?saurus (?:BBQ )?(steak|burger)/) {
  print "Fred wants a $1\n";
}

# /n
if (/(?:bronto)?saurus (?:BBQ )?(?:steak|burger)/n) {
  print "It matched\n";         # there is no $1 now
}


## name capture

use v5.10;
my $names = 'Fred or Barney';
if ( $names =~ m/(\w+) and (\w+)/ ) { # won't match
  say "I saw $1 and $2";
}

use v5.10;
my $names1 = 'Fred or Barney';
if ( $names1 =~ m/(\w+) (and|or) (\w+)/ ) { # matches now
  say "I saw $1 and $2"; # I saw Fred and or
}

use v5.10;
my $names2 = 'Fred or Barney';
if ( $names2 =~ m/(?<name1>\w+) (?:and|or) (?<name2>\w+)/ ) { # label
  say "I saw $+{name1} and $+{name2}"; # capture label
}

use v5.10;
my $names3 = 'Fred or Barney';
if ( $names3 =~ m/((?<name2>\w+) (and|or) (?<name1>\w+))/ ) {
  say "I saw $+{name1} and $+{name2}";
}

# back reference label

use v5.10;
my $names4 = 'Fred Flintstone and Wilma Flintstone';
if ( $names4 =~ m/(?<last_name>\w+) and \w+ \g{last_name}/ ) {
  say "I saw $+{last_name}";
}

use v5.10;
my $names5 = 'Fred Flintstone and Wilma Flintstone';
if ( $names5 =~ m/(?<last_name>\w+) and \w+ \k<last_name>/ ) {
  say "I saw $+{last_name}";
}

# python label
use v5.10;
my $names6 = 'Fred Flintstone and Wilma Flintstone';
if ( $names6 =~ m/(?P<last_name>\w+) and \w+ (?P=last_name)/ ) {
  say "I saw $+{last_name}";
}
