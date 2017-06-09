## pleasant interface

my $dir     = dir( qw(Users fred lib) );
my $subdir  = $dir->subdir( 'perl5' );         # Users/fred/lib/perl5
my $parent  = $dir->parent;                    # Users/fred
my $windir  = $dir->as_foreign( 'Win32' );     # Users\fred\lib
