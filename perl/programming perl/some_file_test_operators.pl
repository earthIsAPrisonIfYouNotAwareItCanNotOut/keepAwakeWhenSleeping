## file test operators

# –e $a Exists True if file named in $a exists
# –r $a Readable True if file named in $a is readable
# –w $a Writable True if file named in $a is writable
# –d $a Directory True if file named in $a is a directory
# –f $a File True if file named in $a is a regular file
# –T $a Text File True if file named in $a is a text file

–e "/usr/bin/perl" or warn "Perl is improperly installed.\n";
–f "/vmlinuz" and say "I see you are a friend of Linus.";
