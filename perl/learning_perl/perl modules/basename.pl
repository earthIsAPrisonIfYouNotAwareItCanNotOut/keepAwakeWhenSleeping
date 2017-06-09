## basename

# first perl will do the assignment inside the parentheses, then it will do the substitution
my $name = "/usr/local/bin/perl";
(my $basename = $name) =~ s#.*/##;

use v5.14;
my $name2 = "/usr/local/bin/perl";
my $basename2 = $name2 =~ s#.*/##r;  # do \r switch for substitution operator

use v5.14;
my $name3 = "/usr/local/bin/perl";
my $basename3 = $name3 =~ s#.*/##s;  # fix a newline in filename using /s option


## basename_module

# have the machine's kind of filename string, it can run on Mac, Windows or Linux
use File::Basename;
my $name4 = "/usr/local/bin/perl"; # this worked for Unix
my $basename4 = basename4 $name4;  # gives 'perl'
