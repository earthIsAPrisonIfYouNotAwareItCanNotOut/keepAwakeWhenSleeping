## global replacements

$_ = "home, sweet home!";
s/home/cave/g;
print "$_\n"; # "cave, sweet cave!"

$_ = "Input data\t may have
extra whitespace.";
s/\s+/ /g; # Now it says "Input data may have extra whitespace."

s/\A\s+//; # Replace leading whitespace with nothing
s/\s+\z//; # Replace trailing whitespace with nothing
s/\A\s+|\s+\z//g; # Strip leading, trailing whitespace
