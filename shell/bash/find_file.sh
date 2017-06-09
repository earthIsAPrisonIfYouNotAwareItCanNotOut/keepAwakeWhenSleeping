## locate

$ locate bin/zip
/usr/bin/zip
/usr/bin/zipcloak
/usr/bin/zipgrep

# locate can be combined with other tools such as grep to design more interresting seatches
$ locate zip | grep bin
/bin/bunzip2
/bin/bzip2
/bin/bzip2recover
/bin/gunzip
/bin/gzip


## find

# in its simplest use, find is given one or more names of directories to search
$ find ~

# since the result is seent to standard output, we can pipe it into other programs
$ find ~ | wc -l  # use wc to count the number of files
49808


## find test

# if you want a list of directories
$ find ~ -type d | wc -l
1695

# or a list of regular files
$ find ~ -type f | wc -l
38737

# find file type
# b    Block special device file
# c    Character special device file
# d    Directory
# f    Regular file
# l    Symbolic link

# search by file size and filename
$ find ~ -type f -name "*.JPG" -size +1M | wc -l
840

# find size units
# b    512 byte blocks. This is the default if no unit is specified.
# c    Btes
# w    Two byte words
# k    Kilobytes (Units of 1024 bytes)
# M    Megabytes (Units of 1048576 bytes)
# G    Gigabytes (Units of 1073741824 bytes)

# find file test
# -cmin n          last modified exactly n minutes ago (less than -n, more than +n)
# -cnewer file     last modified more recently than those of file
# -ctime n         last modified n*24 hours ago
# -empty           empty files and directories.
# -group name      belonging to group
# -iname pattern   Like the -name test but case insensitive.
# -inum n          Match inode number n. finding the hard links to a particular inode
# -mmin n          contents were modified n minutes ago
# -mtime n         contents were modified n*24 hours ago.
# -name pattern    specified wild card pattern
# -newer file      recently than the specified file. backups
# -nouser          belong to a valid user. detect activity by attackers
# -nogroup         belong to a valid group
# -samefile name   match the same inode number as file name.
# -size n          Match files of size n.
# -type c          Match files of type c.
# -user name       belonging to user name


## logical operator

# test for "bad permissios"
# in this case, 0600 is good permission for file, 0700 for directory
$ find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)

# find Logical Operators
# -and    if the tests on both sides of the operator are true. shortened to -a
# -or     if a test on either side of the operator is true. shortened to -o.
# -not    if the test following the operator is false. abbreviated with !
# ()      Groups tests and operators together to form larger expressions

# how and/or logic work
# True   -and   Always performed
# False  -and   Never performed
# Ture   -or    Never performed
# False  -or    Always performed


## predefined actions

# some example
# -delete   Delete the currently matching file.
# -ls       ls command on the matching file. Output is sent to standard output
# -print    Output the full pathname of the matching file to standard output
# -quit     Quit once a match has been made

# it produced a list because the -print action is implied if no other action is specified
$ find ~
$ find ~ -print

# to delete files that have file extension ".BAK"
$ find ~ -type f -name '*.BAK' -delete
# NOTE
# use before use -delete, you should use -print to test it
$ find ~ -type f -name '*.BAK' -print
$ find ~ -type f -and -name '*.BAK' -and -print  # tha same as above
