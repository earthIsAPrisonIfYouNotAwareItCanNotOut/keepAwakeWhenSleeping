## when you run this program with a glob as the single argument, the shell expands the glob before it sends the result to your program. Thus, you think you got many arguments

foreach $arg (@ARGV) {
      print "one arg is $arg\n";
}

# $ perl show-args *.pm
# one arg is barney.pm
# one arg is dino.pm
# one arg is fred.pm
# one arg is wilma.pm

## glob operator

my @all_files = glob '*';
my @pm_files = glob '*.pm';

# the space between these two items inside the quoted string is significant, as it separates two different items you want to glob
my @all_files_including_dot = glob '.* *';

# Tip
# The File::Glob module provides other forms that handle edge cases
