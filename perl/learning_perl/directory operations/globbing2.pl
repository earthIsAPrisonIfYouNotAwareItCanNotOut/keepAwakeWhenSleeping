## angle-bracket

# before the glob operator gave to developers, it used the angle-bracket syntax, similar to reading from a filehandle
my @all_files = <*>;   # exactly the same as my @all_files = glob "*";

# the angle brackets similarly to a double-quoted string, which mean that perl expands variables to their current perl values before begin globbed
my $dir = '/etc';
my @dir_files = <$dir/* $dir/.*>;

## filehandle reading and globbing

# if the item between the angle brackets is strictly a Perl identifier, it’s a filehandle read; otherwise, it’s a globbing operation
# my @files = <FRED/*>;           # a glob
# my @lines = <FRED>;             # a filehandle read
# my @lines = <$fred>;            # a filehandle read
# my $name = 'FRED';
# my @files = <$name/*>;          # a glob

my $name = 'FRED';
my @lines = <$name>;      # an indirect filehandle read of FRED handle

# or you can use readline operator
my $name2 = 'FRED';
my @lines2 = readline FRED;      # read from FRED
my @lines3 = readline $name;     # read from FRED

# Note
# as indirect filehandle reads are uncommon and are generally performed against a simple scalar variable
# we rarely use the readline operator
