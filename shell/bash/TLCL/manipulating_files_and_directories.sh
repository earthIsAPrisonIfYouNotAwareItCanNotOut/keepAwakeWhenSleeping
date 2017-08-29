## cp

# cp options
#   -a --archive      copy the files and directories and all of their attributes
#   -i --ineractive   before overwriting an existing file
#                     prompt the user for confirmation
#   -r --recursive    recursively copy directories
#   -u --update       only copy the file unexist in another directory
#   -v --verbose      Display informative messages as the copy is performed

# cp examples
cp file1 file2        # Copy file1 to file2
                      # If file2 exists, it is overwritten with the contents of file1
                      # If file2 does not exist, it is created
cp -i file1 file2     # Same as above, except that if file2 exists
                      # the user is prompted before it is overwritten
cp file1 file2 dir1   # Copy file1 and file2 into directory dir1
                      # dir1 must already exist
cp dir1/* dir2        # Using a wildcard, all the files in dir1 are copied into dir2
                      # dir2 must already exist
cp -r dir1 dir2       # Copy the contents of directory dir1 to directory dir2
cp -u *.html destination  # copy all the HTML files from one directory to another
                          # but only copy files
                          #   that do not exist in the destination directory


## unix glob

# wildcards
*               # Matches any characters
?               # Matches any single character
[characters]    # Matches any character that is a member of the set characters
[!characters]   # Matches any character that is not a member of the set characters

# character classes
[:alnum:]       # Matches any alphanumeric character
[:alpha:]       # Matches any alphabetic character
[:digit:]       # Matches any numeral
[:lower:]       # Matches any lowercase letter
[:upper:]       # Matches any uppercase

# examples
*                         # All files
g*                        # All file beginning with "g"
b*.txt                    # Any file beginning with "b"
                          #   followed by any characters and ending with ".txt"
Data???                   # Any file beginning with "Data"
                          #   followed by exactly three characters
[abc]*                    # Any file beginning with either an "a", a "b", or a "c"
BACKUP.[0-9][0-9][0-9]    # Any file beginning with "BACKUP."
                          #   followed by exactly three numerals
[[:upper:]]*              # Any file beginning with an uppercase letter
[![:digit:]]*             # Any file not beginning with a numeral
*[[:lower:]123]           # Any file ending with a lowercase letter
                          #   or the numerals "1", "2", or "3"

## mkdir

mkdir dir1 dir2 dir3

## mv

# file renaming
mv item1 item2

# file moving
mv item... directory

# mv options
#   -i --interactive      like in cp options
#   -u --update           like in cp options
#   -v --verbose          like in cp options

# mv examples
mv file1 file2            # Move file1 to file2
                          # If file2 exists
                          #   it is overwritten with the contents of files
                          # If file2 does not exist
                          #   it is created file2
mv -i file1 file2         # Same as above
                          # except that if file2 exists
                          #   the user is prompted before it is overwritten.
mv file1 file2 dir1       # Move file1 and file2 into dirctory dir1
                          #   dir1 must already exist
mv dir1 dir2              # if directory dir2 does not exist
                          #   create directory dir2
                          #   move the contents of directory dir1 into dir2
                          #   delete directory dir1.
                          # if directory dir2 does exist
                          #   move directory dir1 (and its contents) into directory dir2

## rm

# remove (delete)
rm item...

# rm options
#   -i, --interactive    If this option is not specified
#                        rm will silently delete files
#   -r, --recursive      the same as cp option
#   -f, --force          Ignore nonexistent files and do not prompt
#                        This overrides the --interactive option
#   -v, --verbose        the same as cp option

# rm examples
rm file1                 # Delete file1 silently
rm -i file1              # Same as above
                         # except that the user is prompted for confirmation
                         #   before the deletion is performed
rm -r file1 dir1         # Delete file1 and dir1 and its contents
rm -rf file1 dir1        # Same as above
                         # except that if either file1 or dir1 do not exist
                         #   rm will continue silently.

## ln

## ln hard link

# create a hard link
ln file link

# hard link example
$ ln fun fun-hard
$ ln fun dir1/fun-hard
$ ln fun dir2/fun-hard
$ ls -l
drwxrwxr-x 2 me  me 4096 2008-01-14 16:17 dir1
drwxrwxr-x 2 me  me 4096 2008-01-14 16:17 dir2
-rw-r--r-- 4 me  me 1650 2008-01-10 16:33 fun
-rw-r--r-- 4 me  me 1650 2008-01-10 16:33 fun-hard
           ^ the number of hard link

# how to confirms two files are the same
$ ls -li
12353539 drwxrwxr-x 2 me  me 4096  2008-01-14  16:17  dir1
12353540 drwxrwxr-x 2 me  me 4096  2008-01-14  16:17  dir2
12353538 -rw-r--r-- 4 me  me 1650  2008-01-10  16:33  fun
12353538 -rw-r--r-- 4 me  me 1650  2008-01-10  16:33  fun-hard
^ inode number: The system assigns a chain of disk blocks refer to the data part
                fun and fun-hard have the same inode number 12353538
                so they have the same data parts

## ln symbolic link

# create a symbolic link
ln -s item link          # “item” is either a file or a directory

# symbolic link example
$ ln -s fun fun-sym
$ ln -s ../fun dir1/fun-sym
$ ls -l dir1
-rw-r--r-- 4 me  me 1650 2008-01-10 16:33 fun-hard
lrwxrwxrwx 1 me  me    6 2008-01-15 15:17 fun-sym -> ../fun
