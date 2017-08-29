## while statement

print "How many tickets have we sold so far? ";
my $before = <STDIN>;

my $sold = $before;
while ($sold < 10000) {
    my $available = 10000 – $sold;
    print "$available tickets are available.  How many would you like: ";
    my $purchase = <STDIN>;
    if ($purchase > $available) {
        say "Too many! Try again.";
        $purchase = 0;
    }
    $sold += $purchase;
}
say "This show is sold out, please come back later.";

## blank lines and exit the loop

while (my $line = <GRADES>) {

## an array in scalar context

while (@ARGV) {
    process(shift @ARGV);
}

## the three-part loop

print "How many tickets have we sold so far? ";
my $before = <STDIN>;

for (my $sold = $before; $sold < 10000; $sold += my $purchase) {
    my $available = 10000 – $sold;
    print "$available tickets are available. How many would you like: ";
    $purchase = <STDIN>;
    if ($purchase > $available) {
        say "Too many! Try again.";
        $purchase = 0;
    }
}
say "This show is sold out, please come back later.";

## the foreach loop

for my $user (@users) {
    if (–f "$home{$user}/.nexrc") {
        say "$user is cool... they use a perl–aware vi!";
    }
}

# for my $key (sort keys %hash) {

## breaking out - next and last
