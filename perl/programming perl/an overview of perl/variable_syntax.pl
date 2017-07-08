my $phrase = "Howdy, world!\n";    # Create a variable.
print $phrase;                     # Print the variable.

## make reference

my $ary = \@myarray;               # reference to a named array
my $hsh = \%myhash;                # reference to a named hash
my $sub = \&mysub;                 # reference to a named subroutine
my $ary = [1,2,3,4,5];             # reference to an unnamed array
my $hsh = {Na => 19, Cl => 35};      # reference to an unnamed hash
my $sub = sub { print $state };    # reference to an unnamed subroutine
my $fido = Camel–>new("Amelia");   # reference to an object

# object acts like a simple scalar value
my $fido = Camel–>new("Amelia");
if (not $fido) { die "dead camel"; }
$fido–>saddle();

## auto convert
## double quotes
## backslash

# $camels + 1 will convert "123" to number 123
# print will convert 124 to "124"
my $camels = "123";
print $camels + 1, "\n";

## array and hash

# to assign a list value to an array
my @home = ("couch", "chair", "table", "stove");
# if you use @home in list context
#   such as on the right side of a list assignment
# you could create four scalar variables from array
my ($potato, $lift, $tennis, $pipe) = @home;
# these are called list assignment, they happen in parallel
# so you can swap two existing variables
($alpha,$omega) = ($omega,$alpha);

# if you wnat to select an individual array element
my @home;
$home[0] = "couch";
$home[1] = "chair";
$home[2] = "table";
$home[3] = "stove";

## the % sigil

my %longday = ("Sun", "Sunday", "Mon", "Monday", "Tue", "Tuesday",
               "Wed", "Wednesday", "Thu", "Thursday", "Fri",
               "Friday", "Sat", "Saturday");

## syntactic sugar =>

my %longday = (
    "Sun" => "Sunday",
    "Mon" => "Monday",
    "Tue" => "Tuesday",
    "Wed" => "Wednesday",
    "Thu" => "Thursday",
    "Fri" => "Friday",
    "Sat" => "Saturday",
);

## access hash element

# the relationship encoded in a hash is genitive or possessive
#   like the word "of" in English
my %wife;
$wife{"Adam"} = "Eve"; # the wife of Asam is Eve

## complexities

# if Jacob had four wives

# parentheses used for syntactic grouping
#   commas for syntactic separation
# even parentheses and commas are not powerful enough
#   to turn a list into a scalar in perl
$wife{"Jacob"} = ("Leah", "Rachel", "Bilhah", "Zilpah"); # WRONG

# create an unnamed array and puts a reference to it into the hash element
$wife{"Jacob"} = ["Leah", "Rachel", "Bilhah", "Zilpah"]; # ok

# assign individual elements
$wife{"Jacob"}[0] = "Leah";
$wife{"Jacob"}[1] = "Rachel";
$wife{"Jacob"}[2] = "Bilhah";
$wife{"Jacob"}[3] = "Zilpah";

# to list not only Jacob's wives but all the sons of each of this wives

# treat a hash as as scalar, have an array in a hash
my %kids_of_wife;
$kids_of_wife{"Jacob"} = {
    "Leah" => ["Reuben", "Simeon", "Levi", "Judah", "Issachar", "Zebulun"],
    "Rachel" => ["Joseph", "Benjamin"],
    "Bilhah" => ["Dan", "Naphtali"],
    "Zilpah" => ["Gad", "Asher"],
}
# more or less equivalent
my %kids_of_wife;
$kids_of_wife{"Jacob"}{"Leah"}[0] = "Reuben";
$kids_of_wife{"Jacob"}{"Leah"}[1] = "Simeon";
$kids_of_wife{"Jacob"}{"Leah"}[2] = "Levi";
$kids_of_wife{"Jacob"}{"Leah"}[3] = "Judah";
...

# perl lets you pretend that a complex data structure is a simple scalar
my $fido = Camel–>new("Amelia");

## topicalizing

# establish a namespace

# perl will automatically prefixing any global name with module name
#   the real name of $fido is $Camel::fido, &fetch is &Camela::fetch
package Camel;
our $fido = &fetch();
# we were invoking the &new verb in the Camel package (&Camel::new)
my $fido = Camel–>new("Amelia");
# because $fido remember that it is pointing to a Camel
# we were incoking the &Camel::saddle
$fido–>saddle();

# borrow the nouns and verbs of another package

# the interesting thing is that
#   you yourself don't really need to know what a Camel is
#   you can get someone else to write the Camel module for you
use Camel;
my $fido = Camel–>new("Amelia");
# use CPAN module
use Some::Cool::Module;

# pragmas

# in fact, some of the build-in modules don't actually introduce verbs at all
#   but simple wrap the perl language in various useful ways
#   we call these special modules pragmas

# what the strict module does is tighten up some of the rules
#   so that you have to be more explicit about various things
#     that perl would otherwise guess about
use strict;

# another build-in pragma is just the version number of perl
use v5.14;

## verbs

# a statement starting with a verb is generally purely impreative
#   and evaluated entirely for its side effects
say "Adam's wife is $wife{'Adam'}.";
# this has the side effect of producting the desired output
# Adam's wife is Eve.

# other verbs translate their input parameters into return values
#   just as a recipe tells you how to turn raw ingredients into something edible
#   we tend to call these verbs functions
my $e = exp(1); # 2.718281828459 or thereabouts
