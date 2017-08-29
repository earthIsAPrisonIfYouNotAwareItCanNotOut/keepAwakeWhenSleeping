## id

# example

# When user accounts are created
#   users are assigned a number called a user ID or uid=0
# The user is assigned a primary group ID or gid and may belong to additional groups

# Fedora starts its numbering of regular user accounts at 500
$ id
uid=500(me) gid=500(me) groups=500(me)

# Ubuntu starts at 1000
# the Ubuntu user belongs to a lot more groups
# This is Ubuntu manages privileges for system devices and services
$ id
uid=1000(me) gid=1000(me)
groups=4(adm),20(dialout),24(cdrom),25(floppy),29(audio),30(dip),44(v
deo),46(plugdev),108(lpadmin),114(admin),1000(me)


## read, write and execute

# The first ten characters of the listing are the file attributes
$ > foo.txt
$ ls -l foo.txt
-rw-rw-r-- 1 me   me   0 2008-03-06 14:52 foo.txt
^

# the first one of ten file attributes is access rights to files
# acess rights
# -           regular file
# d           directory
# l           symbolic link
# c           character special file
# b           block special file

# The remaining nine characters of the file attributes
#   called the owner, the group, and the world permissions

#   Owner    Group    World
#   rwx      rwx      rwx

#   permission     file                           directory
#   r              open                           list contents (the execute is also set)
#   w              written or truncated           create delete rename files
#   x              execute                        entered


## chmod

# chmod supports two distinct ways of specifying mode changes

# octal number representation

# Octal Binary  File Mode
# 0     000     ---
# 1     001     --x
# 2     010     -w-
# 3     011     -wx
# 4     100     r--
# 5     101     r-x
# 6     110     rw-
# 7     111     rwx

# By using *three octal digits*
# we can set the file mode for the owner, group owner, and world
$ > foo.txt
$ ls -l foo.txt
-rw-rw-r-- 1 me    me    0  2008-03-06 14:52 foo.txt
$ chmod 600 foo.txt
$ ls -l foo.txt
-rw------- 1 me    me    0  2008-03-06 14:52 foo.txt

# symbolic representation
#   is divided into three parts

# To specify who is affected
# u         user
# g         group
# o         others
# a         all

# NOTE
# if no character is specified, "all" will be assumed

# which operation will be performed
# +         add
# -         taken away
# =         only apply

# example
# u+x
# u-x
# +x
# o-rw
# go=rw


## umask

# uses octal notation to express a mask of bits to be removed
#   from a file’s mode attributes
[me@linuxbox ~]$ rm foo.txt
[me@linuxbox ~]$ umask 0000
[me@linuxbox ~]$ > foo.txt
[me@linuxbox ~]$ ls -l foo.txt
-rw-rw-rw- 1 me   me    0 2008-03-06 14:58 foo.txt
# NOTE
# When we set the mask to 0000 (effectively turning it off)

# Original file mode  --- rw- rw- rw-
# Mask                000 000 000 010
# Result              --- rw- rw- r--

# Original file mode  --- rw- rw- rw-
# Mask                000 000 010 010
# Result              --- rw- r-- r--

# most of the time you won't have to change the mask
# in some high-security situations you need use mask
#   to set some special permissions

# some special permissions

# the setuid bit (octal 4000)
# When applied to an executable file
#   it sets the effective user ID to that of the program’s owner
# TIP
# if the program run with privileges of the superuser
#   it will raises security concerns, so number of setuid must be an absolute mininum

# the setgid bit (octal 2000)
# like the setuid bit
#   changes the effective group ID from the real group ID of the user
#   to that of the file owner
# TIP
# This is useful in a shared directory
#   when members of a common group need access to all the files in the directory
#   regardless of the file owner’s primary group

# the sticky bit (octal 1000)
# it was possible to mark an executable file as "not swappable"
# TIP
# it prevents users from deleting or renaming files
#   This is often used to control access to a shared directory

# some examples of using chmod with symbolic notation
#  to set these special permissions
chmod g+s dir         # assigning setuid to a program
chmod g+s dir         # assigning setgid to a directory
chmod +t dir          # assigning the sticky bit to a directory


## alternate identity

# There are three ways to take on an alternate identity

# Log out and log back in as the alternate user

# su
# is used to start a shell as another user
# su [-[l]] [user]
# starting a new interactive command by using su
$ su -       # -l may be abbreviated -
             # -l option will get a login shell for the specified user
             #   this can load the user's config

# su -c 'command'
# using this form, a single command line is passed to the new shell for execution
$ su -c 'ls -l /root/*'
Password:
-rw------- 1 root root    754 2007-08-11 03:19 /root/anaconda-ks.cfg
/root/Mail:
total 0

# sudo
# execute a command as another user
$ sudo backup_script
Password:
System Backup Starting...
$ sudo -l     # To see what privileges are granted by sudo, use the “-l” option
User me may run the following commands on this host:
(ALL) ALL
# NOTE
# ubuntu disables logins to the root account
# and instead uses sudo to grant superuser privileges


## chown

# chown [[owner]:[group]] file...
# change the owner and group owner of a file or directory

# argument example
# bob                   Changes file owner to user bob
# bob:users             Changes file owner to user bob
#                         changes file group owner to group users
# :admins               Changes group owner to the group admins, file owner is unchanged
# bob:                  Change file owner to user bob
#                         and changes the group owner to the login group of user bob

# janet changes the ownership of the copied file from janet to tony
$ sudo cp myfile.txt ~tony
Password:
$ sudo ls -l ~tony/myfile.txt
-rw-r--r-- 1 root  root 8031 2008-03-20 14:30 /home/tony/myfile.txt
$ sudo chown tony: ~tony/myfile.txt
$ sudo ls -l ~tony/myfile.txt
-rw-r--r-- 1 tony  tony 8031 2008-03-20 14:30 /home/tony/myfile.txt


## share directory usecase

# the directory is owned by root and has 755 permissions
# To make this directory sharable
#   bill needs to change the group ownership and the group permissions to allow writing
$ sudo chown :music /usr/local/share/Music
$ sudo chmod 775 /usr/local/share/Music
$ ls -ld /usr/local/share/Music
drwxrwxr-x 2 root music 4096 2008-03-21 18:05 /usr/local/share/Music

# the default umask on this system is 0022
# which prevents group members from writing files belonging to
#   other members of the group
$ > /usr/local/share/Music/test_file
$ ls -l /usr/local/share/Music
-rw-r--r-- 1 bill    bill    0 2008-03-24 20:03 test_file

# This can be fixed by setting the setgid bit on the directory
$ sudo chmod g+s /usr/local/share/Music
$ ls -ld /usr/local/share/Music
drwxrwsr-x 2 root music 4096 2008-03-24 20:03 /usr/local/share/Music

# bill sets his umask to 0002
# and allow all members of the group music to create files
#   and directories inside directory
$ umask 0002
$ rm /usr/local/share/Music/test_file
$ > /usr/local/share/Music/test_file
$ mkdir /usr/local/share/Music/test_dir
$ ls -l /usr/local/share/Music
drwxrwsr-x 2 bill   music 4096 2008-03-24 20:24 test_dir
-rw-rw-r-- 1 bill   music 0 2008-03-24 20:22 test_file


## passwd

# passwd [user]
# setting passwords for yourself
# and for other users if you have access to superuser privileges

# example
$ passwd
(current) UNIX password:
New UNIX password:
