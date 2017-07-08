## open

# the name you pick for the filehandle is arbitrary
# once opened, the filehandle SESAME can be used
#   to access the file or pipe
#   until it is explicitly closed -- close(SESANE)
open(SESAME,    "filename")            # read from existing file
open(SESAME, "<  filename")            # (same thing, explicitly)
open(SESAME, ">  filename")            # create file and write to it
open(SESAME, ">> filename")            # append to existing file
open(SESAME, "| output–pipe–command")  # set up an output filter
open(SESAME, "input–pipe–command |")   # set up an input filt

# the recommended three-argument form
open(SESAME, "<",  $somefile)              # read from existing file
open(SESAME, ">",  $somefile)              # create file and write to it
open(SESAME, ">>", $somefile)              # append to existing file
open(SESAME, "|–", "output–pipe–command")  # set up an output filter
open(SESAME, "–|", "input–pipe–command")   # set up an input filter

# the form of open also lets you specify the character encoding of the file
open(SESAME, "< :encoding(UTF-8)",     $somefile)
open(SESAME, "> :crlf",                $somefile)
open(SESAME, ">> :encoding(MacRoman)", $somefile)

# if you pass open an undefined variable (such as my creates)
#    perl will pick the filehandle for you and fill it in automatically

# if the open succeeds, the $handle variable is now defined
#    and you can use it wherever a filehandle is expected
open(my $handle, "< :crlf :encoding(cp1252)", $somefile)
|| die "can't open $somefile: $!";

# once you've opened a filehandle for input
#   you can read a line using the line reading operator <>

# the angle operator encloses the filehandle you want to read lines from
#   <SESAME> if a literal
#   <$handle> for indirect one

# the empty angle operator, <>
#   will read lines from all the files specified on the command lines
#   or STDIN if no arguments were specified
print STDOUT "Enter a number: ";      # ask for a number
$number = <STDIN>;                    # input the number
say STDOUT "The number is $number.";  # print the number

# if you try the previous example
#    you may notice that you get an extra blank line
# this happens because the line-reading operation
#    does not automatically remove the newline from your input line

# perl provides the chop and chomp funtion
#   chop to indiscriminately remove the last character of the string
#   chomp will only remove the end of record marker (generally, \n)
chomp($number = <STDIN>);  # input a number, then remove its newline
