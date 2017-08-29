## echo

# Any argument passed to echo gets displaye
$ echo this is a test
this is a test

## filepath expansiions

$ echo *
Desktop Documents ls-output.txt Music Pictures Public Templates Videos
$ echo D*
Desktop  Documents
$ echo *s
Documents Pictures Templates Videos
$ echo [[:upper:]]*
Desktop Documents Music Pictures Public Templates Videos

# listing of hidden files
$ ls -d .[!.]?*
$ ls -A

## (“~”)

# home directory of the named user
$ echo ~
/home/me
$ echo ~foo
/home/foo

## arithmetic expression

# use as a calculator
$ echo $((2 + 2))  # $((expression))
4
$ echo $(((5**2) * 3))  # nest
75

## brace expansion

# comma-separated list of string
$ echo Front-{A,B,C}-Back
Front-A-Back Front-B-Back Front-C-Back
$ echo a{A{1,2},B{3,4}}b  # nest
aA1b aA2b aB3b aB4b

# a range of integers or single characters
$ echo Number_{1..5}      # number
Number_1  Number_2  Number_3  Number_4  Number_5
$ echo {Z..A}             # letter
Z Y X W V U T S R Q P O N M L K J I H G F E D C B A

# make lists of files or directories
$ mkdir Pics
$ cd Pics
$ mkdir {2007..2009}-0{1..9} {2007..2009}-{10..12}
$ ls
2007-01 2007-07 2008-01 2008-07 2009-01 2009-07
2007-02 2007-08 2008-02 2008-08 2009-02 2009-08
2007-03 2007-09 2008-03 2008-09 2009-03 2009-09
2007-04 2007-10 2008-04 2008-10 2009-04 2009-10
2007-05 2007-11 2008-05 2008-11 2009-05 2009-11
2007-06 2007-12 2008-06 2008-12 2009-06 2009-12

## parameter expansion

# Many variables are available for your examination
$ echo $USER       # the variable named “USER” contains your user name
me
$ printenv | less  # To see a list of available variables
$ echo $SUER
$                  # if you mistype a pattern, it will result in an empty string

## command substitution

# allows us to use the output of a command as an expansion
$ echo $(ls)
Desktop Documents ls-output.txt Music Pictures Public Templates
Videos

# getting the listing of of the cp program without having to know its full pathname
$ ls -l $(which cp)
-rwxr-xr-x 1 root root 71516 2007-12-05 08:58 /bin/cp

# the results of the pipeline became the argument list of the file command
$ file $(ls /usr/bin/* | grep zip)
/usr/bin/bunzip2:     symbolic link to `bzip2`

# uses *back-quotes* instead of the dollar sign and parentheses
$ ls -l `which cp`
-rwxr-xr-x 1 root root 71516 2007-12-05 08:58 /bin/cp

## quoting

# extra whitespace
$ echo this is a    test
this is a test

# $1
$ echo The total is $100.00
The total is 00.00

## double quotes

# Remember, parameter expansion, arithmetic expansion
#   and command substitution still take place within double quotes
$ echo "$USER $((2+2)) $(cal)"
me 4    February 2008
Su Mo Tu We Th Fr Sa
....

# shell will seperate file name "two words.txt" to "two" and "words.txt"
$ ls -l two words.txt
ls: cannot access two: No such file or directory
ls: cannot access words.txt: No such file or directory
# By using double quotes, we stop the word-splitting and get the desired result
$ ls -l "two words.txt"
-rw-rw-r-- 1 me   me   18 2008-02-20 13:03 two words.txt
$ mv "two words.txt" two_words.txt

# include double quotes, it become part of the argument
$ echo this is a   test
this is a test
$ echo "this is a    test"
this is a    test

## single quotes

# a comparison of unquoted, double quotes, and single quotes
$ echo text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER
text /home/me/ls-output.txt a b foo 4 me
$ echo "text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER"
text ~/*.txt   {a,b} foo 4 me
$ echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER'
text ~/*.txt  {a,b} $(echo foo) $((2+2)) $USER

## escape character

$ echo "The balance for user $USER is: \$5.00"
The balance for user me is: $5.00
$ mv bad\&filename good_filename

# Adding the ‘-e’ option to echo will enable interpretation of escape sequences
sleep 10; echo -e "Time's up\a"
sleep 10; echo "Time's up" $'\a'
