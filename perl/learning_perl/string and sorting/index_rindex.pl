## index(arg1, arg2, arg3)  --forward search

# locates the first occurrence of the argument2 within the argument1
my $stuff = "Howdy world!";
my $where = index($stuff, "wor");  # $where gets 6

# argument3 is effectively giving a minimum value for the return value
my $stuff1  = "Howdy world!";
my $where1 = index($stuff, "w");                  # $where1 gets 2
my $where2 = index($stuff, "w", $where1 + 1);     # $where2 gets 6
my $where3 = index($stuff, "w", $where2 + 1);     # $where3 gets -1 (not found)

# index loop form
use v5.10;

my $stuff2  = "Howdy world!";

my @where = ();
my $where4 = -1;
while ( 1 ) {
  $where4 = index( $stuff, 'w', $where4 + 1 );
  last if $where4 == -1;
  push @where, $where4;
}
say "Positions are @where";


## rindex(arg1, arg2, arg3)  --backward search

my $last_slash = rindex("/etc/passwd", "/");  # value is 4

# the arg3 effectively gives the maximum permitted return value
my $fred = "Yabba dabba doo!";
my $where5 = rindex($fred, "abba");                  # $where1 gets 7
my $where6 = rindex($fred, "abba", $where1 - 1);     # $where2 gets 1
my $where7 = rindex($fred, "abba", $where2 - 1);     # $where3 gets -1

# rindex loop form
use v5.10;

my $fred1 = "Yabba dabba doo!";

my @where2 = ();
my $where8 = length $fred1;
while (  ) {
  $where8 = rindex($fred1, "abba", $where8 - 1 )
  last if $where8 == -1;
  push @where2, $where8;
}
say "Positions are @where2";
