## locate

# the locate program performs a rapid database search of pathnames
# and outputs every name that matches a given substring
$ locate bin/zip
/usr/bin/zip
/usr/bin/zipcloak
/usr/bin/zipgrep

# locate can be combined with other tools
# such as grep to design more interresting seatches
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

# use wc to count the number of files
$ find ~ | wc -l
49808

# if you want a list of directories
$ find ~ -type d | wc -l
1695

# or a list of regular files
$ find ~ -type f | wc -l
38737

# the common file type supported by find
# b    Block special device file
# c    Character special device file
# d    Directory
# f    Regular file
# l    Symbolic link

# search by file size and filename
$ find ~ -type f -name "*.JPG" -size +1M | wc -l
840

# the character may be used to specify units supported by find
# b    512 byte blocks. This is the default if no unit is specified.
# c    Btes
# w    Two byte words
# k    Kilobytes (Units of 1024 bytes)
# M    Megabytes (Units of 1048576 bytes)
# G    Gigabytes (Units of 1073741824 bytes)

# the tests supported by find
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

# if we need to determine
#   if all the files and subdirectories in a directory
#   had secure permission
# in this case, 0600 is good permission for file, 0700 for directory
$ find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)
$ find ~ ( -type f -not -perms 0600 ) -or ( -type d -not -perms 0700 )

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

# expr1 -and expr2
# we know that the expression expr1 -and expr2 cannot be true
# if the result of expr1 is false
#   there is no point in performing expr2

# expr1 -or expr2
# if expr1 is true there is no point in performing expr2
# unless we already know that the expression expr1 -or expr2 is true

## predefined actions

# a few of the predefined actions
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

## user-defined actions

# the traditional way of doing this is with the -exec action
#   where command is the name of a command
#   {} is a symbolic representation of the current pathname
#   the semicolon is a retuired delimiter indicating the end of the command
-exec command {} ;
# since the brace and semicolon characters have special meaning to the shell
#   they must be quoted or escaped
-exec rm '{}' ';'

# by using the -ok action in place of -exec
# the user is prompted before execution of each specified command
find ~ -type f -name 'foo*' -ok ls -l '{}' ';'
< ls ... /home/me/bin/foo > ? y

## combine the results of the search

# think of these
ls -l file1
ls -l file2
ls -l file1 file2

# by changing the trailing semicolon character to a plus sign
# we activate the ability of find to combine the results of the search
#   into an argument list for a single execution of the desired command
find ~ -type f -name 'foo*' -exec ls -l '{}' ';'
-rwxr-xr-x 1 me     me 224 2007-10-29 18:44 /home/me/bin/foo
-rw-r--r-- 1 me     me 0 2008-09-19 12:53 /home/me/foo.txt
find ~ -type f -name 'foo*' -exec ls -l '{}' +
-rwxr-xr-x 1 me     me 224 2007-10-29 18:44 /home/me/bin/foo
-rw-r--r-- 1 me     me 0 2008-09-19 12:53 /home/me/foo.txt


## xargs

# it accepts input from standard input
# and converts it into an argument list for a specified command
$ find ~ -type f -name 'foo*' -print | xargs ls -l
-rwxr-xr-x 1 me     me 224 2007-10-29 18:44 /home/me/bin/foo
-rw-r--r-- 1 me     me 0 2008-09-19 12:53 /home/me/foo.txt
# NOTE
# it is possible to create commands that are too long for the system
# xargs will only execute the maxumum number of arguments
# use -show-limits option to see maximum size of the command line

## dealing with funny filenames

# to overcome this
# find and xargs allow the optional use of a null character as argument separator
# the find command provides the action -print0
#   which produces null separated output
#   and the xargs command has the -null option
#     which accepts null separated input
$ find ~ -iname ‘*.jpg’ -print0 xargs –null ls -l


## the find practical use

# 1. create a playground with lots of subdirectories and files

# the method we employed to accomplish this magic
#   involved a familiar command (mkdir)
#   an exotic shell expansion (brace)
#   and a new command, touch
#   by conbining mkdir with the -p option
#     which cause to create the parent directories of the specified paths
$ mkdir -p playground/dir-{00{1..9},0{10..99},100}
$ touch playground/dir-{00{1..9},0{10..99},100}/file-{A..Z}

## touch

# the touch command is usually used to
#   set or update the access, change, and modify times of files
# if a filename argument is that of a nonexistent file
#   an empty file is create

# we create one hundred instances of a file named file-A
# to confirm thatwe actually have one hundred instance of the files
#   we use wc -l
# NOTE
# unlike ls, find does not produce results in sorted order
$ find playground -type f -name 'file-A'
$ find playground -type f -name 'file-A' | wc -l

# 2. next, let's look at finding files based on their modification times

# this creates an empty file named timestamp
#   and sets its modification time to the current time
# we can verify this by using another handy command, stat
#   which is a kind of souped-up version of ls
$ touch playground/timestamp

## stat

# the stat command reveals all that the system understands
#   about a file and its attributes
$ stat playground/timestamp
File: 'playground/timestamp'
Size: 0 Blocks: 0 IO Block: 4096 regular empty file
Device: 803h/2051d Inode: 14265061 Links: 1
Access: (0644/-rw-r--r--) Uid: ( 1001/ me) Gid: ( 1001/ me)
Access: 2008-10-08 15:15:39.000000000 -0400
Modify: 2008-10-08 15:15:39.000000000 -0400
Change: 2008-10-08 15:15:39.000000000 -0400

# if we touch the file again and then examine it with stat
#   we will see that the file's times have been updated
$ touch playground/timestamp
$ stat playground/timestamp
File: 'playground/timestamp'
Size: 0 Blocks: 0 IO Block: 4096 regular empty file
Device: 803h/2051d Inode: 14265061 Links: 1
Access: (0644/-rw-r--r--) Uid: ( 1001/ me) Gid: ( 1001/ me)
Access: 2008-10-08 15:23:33.000000000 -0400
Modify: 2008-10-08 15:23:33.000000000 -0400
Change: 2008-10-08 15:23:33.000000000 -0400

# 3. let's use find to update some of our playground files

# this updates all files in the playground named file-B
# we'll use find to identify the updated files by comparing
#   all the files to the reference file timestamp
# the file-B are now newer than timestamp
$ find playground -type f -name 'file-B' -exec touch '{}' ';'
$ find playground -type f -newer playground/timestamp

# 4. finally, let's go back to the bad permissions test we performed earlier
#      and apply it to playground

# because none of them meets our definition of "good permissions"
#   with our knowledge of operator and action
#   we can add action to this command to apply new permissions
#     to the file and directories
$ find playground \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)
$ find playground \( -type f -not -perm 0600 -exec chmod 0600 '{}' ';' \)
   -or \( -type d -not -perm 0711 -exec chmod 0700 '{}' ';' \)

## find options

# the options are used to control the scope of a find search
-depth                # Direct find to process a directory’s files
                      #   before the directory itself
-maxdepth levels      # Set the maximum number of levels that find will descend into a
                      #   directory tree when performing tests and actions
-mindepth levels      # Set the minimum number of levels that find will descend into a
                      #   directory tree before applying tests and actions
-mount                # Direct find not to traverse directories
                      #   that are mounted on other file systems
