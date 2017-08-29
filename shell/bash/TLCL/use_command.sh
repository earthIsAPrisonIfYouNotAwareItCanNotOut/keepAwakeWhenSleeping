## type

# type example
$ type type
type is a shell builtins
$ type ls
ls is aliased to `ls --color=tty`
$ type cp
cp is /bin/cp

## which

# which example
$ which ls
/bin/ls

# which only works for executable programs
$ which cd # not builtins nor aliases
/usr/bin/which: no cd in

## help

# help examples
# Many executable programs support a “--help” option
$ mkdir --help
Usage: mkdir [OPTION] DIRECTORY...
Create ...
# use it followed by the name of the shell builtin
$ help cd
cd: cd [-L|-P] [dir]
Change ...

## man

# man examples
$ man ls
On most Linux systems, man uses less to display the manual page
  so all of the familiar less commands work while displaying the page

## apropos

# apropos examples
$ apropos floppy
create_floppy_devices (8)   - udev callout to create all possible
...
# The first field in each line of output is the name of the man page
# the second field shows the section

## alias

# unalias
$ type foo
bash: type: foo: not found
$ alias foo='cd /usr; ls; cd -'
: to remove alias
$ unalias foo
