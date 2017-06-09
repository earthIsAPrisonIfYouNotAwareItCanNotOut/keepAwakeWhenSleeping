## import list

# here, you'll get nothing but basename
use File::Basename qw/ basename /;

# and here, you ask for no  funtions at all
use File::Basename qw/ /;
use File::Basename ();


#1# not import list

use File::Basename qw/ /;         # import no function names
my $betty = &dirname($wilma);     # uses your own subroutine &dirname
                                  # (not shown)
my $name = "/usr/local/bin/perl";
my $dirname = File::Basename::dirname $name; # dirname from the module
