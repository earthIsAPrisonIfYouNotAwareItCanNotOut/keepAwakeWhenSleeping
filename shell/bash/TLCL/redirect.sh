## >

# To redirect standard output to another file besides the screen
$ ls -l /usr/bin > ls-output.txt

# example
$ ls -l /bin/usr > ls-output.txt
ls: cannot access /bin/usr: No such file or directory
$ ls -l ls-output.txt
-rw-rw-r-- 1 me   me    0 2008-02-01 15:08 ls-output.txt

## >>

# example
$ ls -l /usr/bin >> ls-output.txt
$ ls -l /usr/bin >> ls-output.txt
$ ls -l /usr/bin >> ls-output.txt
$ ls -l ls-output.txt
-rw-rw-r-- 1 me   me    503634 2008-02-01 15:45 ls-output.txt

## file descriptor

# redirect stdout and stderr
$ ls -l /bin/usr > ls-output.txt 2>&1

# &>
$ ls -l /bin/usr &> ls-output.txt

## /dev/null

# To suppress error messages from a command
$ ls -l /bin/usr 2> /dev/null

## cat

# display files without paging
$ cat ls-output.txt
# join large files together
$ cat movie.mpeg.0* > movie.mpeg
# no arguments
$ cat
The quick brown fox jumped over the lazy dog.
# create a file
$ cat > lazy_dog.txt
The quick brown fox jumped over t

## <

# change the source of standard input
$ cat < lazy_dog.txt
The quick brown fox jumped over the lazy dog.

## |

# standard output into another standard input
$ ls /bin /usr/bin | sort | uniq | less

## uniq

# the “-d” option
$ ls /bin /usr/bin | sort | uniq -d

## wc

# The “-l” option
$ ls /bin /usr/bin | sort | uniq | wc -l
2728

## grep

# find all file have "zip" keyword
$ ls /bin /usr/bin | sort | uniq | grep zip
bunzip2
bzip2
gunzip
...

## head / tail

$ head -n 5 ls-output.txt
total 343496
...
$ tail -n 5 ls-output.txt
...
$ ls /usr/bin | tail -n 5
znew
...

# tee

# read stdin and copy stdout to ls.txt
$ ls /usr/bin | tee ls.txt | grep zip
bunzip2
bzip2
....
