=pod
ensure that the file doesn't already exist so that you don't accidentally overwrite it
you can use the -e file test
=cut

die "Oops! A file called '$filename' already exists.\n"
  if -e $filename;

=pod
checking whether a file is being kept up-to-date
the -M file test returns the file modification time in days since the start of the program
=cut

warn "Config file is looking pretty old!\n"
  if -M CONFIG > 28;

=pod
remove a large file to a backup when it hasn't been accessed in the last 90 days
the -s file test operator return the file size in bytes
=cut

my @original_files = qw/ fred barney betty wilma pebbles dino bamm-bamm /;
my @big_old_files;           # The ones we want to put on backup tapes
foreach my $filename (@original_files) {
  push @big_old_files, $filename
    if -s $filename > 100_000 and -A $filename > 90;
}

=pod
the -r -s test a list of filenames to see which ones are readable
-t is exception, because that is only use in TTY (by default, it test STDIN)
=cut

foreach (@lots_of_filenames) {
  print "$_ is readable\n" if -r; # same as -r $_
}

=pod
when the perl parser sees the slash after -s operator, it will looking for the optional operand for -s (just like a filename in regular expression), rather than a division
=cut

# The filename is in $_
my $size_in_K = -s / 1024;  # Oops!
my $size_in_k = (-s) / 1024;  # Uses $_ by default

# of course, it's always safe to explicitly give a file test a parameter
my $size_in_k = (-s $filename) / 1024;  # uses $_ by default
