## key access

# $hash{$some_key}
$family_name{'fred'} = 'flintstone';
$family_name{'barney'} = 'rubble';

# hash name rule
#   family_name:  name "for" family
foreach my $person (qw< barney fred >) {
  print "I've heard of $person $family_name{$person}.\n";
}

# key can be any expression
$foo = 'bar';
print $family_name{ $foo . 'ney' }; # prints 'rubble'

# overwrite
$family_name{'fred'} = 'astaire'; # gives new value to existing element
$bedrock = $family_name{'fred'}; # gets 'astaire'; old value is lost

# not existence
$family_name{'wilma'} = 'flintstone'; # adds a new key (and value)
$family_name{'betty'} .= $family_name{'barney'}; # creates the element if needed
$granite = $family_name{'larry'}; # No larry here: undef
