@ARGV = qw# larry moe curly #;         # @ARGV
while (<>) {                           # <>
    chomp;
    print "It was $_ that I saw in some stooge-like file!\n";
}
