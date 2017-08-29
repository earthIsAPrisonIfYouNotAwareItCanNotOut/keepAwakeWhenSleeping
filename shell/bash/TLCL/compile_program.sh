## history of programming language

# machine language (numeric code)
# v
# assembly language (replace numeric code with CPY for copy MOV for move e.g.,)
# v
# high-level programming language (converted into machine language by compiler)
# v
# script language (executed by a special program called an interpreter)


## interpreted program and compiled program

# interpreted program execute much more slowly than compiled programming
# because each source code instruction in an interpreted program
# is tranlated every time it is carried out
# whereas with a compiled program, a source code instruction is only translated once
# and this translattion is permanently recorded in the final executable file


## compiler a gnu c program

# gcc

# check to see if the compiler is present
[me@linuxbox ~]$ which gcc
# /usr/bin/gcc

# source code

[me@linuxbox ~]$ mkdir src
[me@linuxbox ~]$ cd src
[me@linuxbox src]$ ftp ftp.gnu.org
# Connected to ftp.gnu.org.
# 220 GNU FTP server ready.
# Name (ftp.gnu.org:me): anonymous
# 230 Login successful.
# Remote system type is UNIX.
# Using binary mode to transfer files.
ftp> cd gnu/diction
# 250 Directory successfully changed.
ftp> ls
# 200 PORT command successful. Consider using PASV.
# 150 Here comes the directory listing.
# -rw-r--r-- 1 1003 65534 68940 Aug 28 1998 diction-0.7.tar.gz
# -rw-r--r-- 1 1003 65534 90957 Mar 04 2002 diction-1.02.tar.gz
# -rw-r--r-- 1 1003 65534 141062 Sep 17 2007 diction-1.11.tar.gz
# 226 Directory send OK.
ftp> get diction-1.11.tar.gz
# local: diction-1.11.tar.gz remote: diction-1.11.tar.gz
# 200 PORT command successful. Consider using PASV.
# 150 Opening BINARY mode data connection for diction-1.11.tar.gz
# (141062 bytes).
# 226 File send OK.
# 141062 bytes received in 0.16 secs (847.4 kB/s)
ftp> bye
# 221 Goodbye.
[me@linuxbox src]$ ls
# diction-1.11.tar.gz


## unpack

[me@linuxbox src]$ tar xzf diction-1.11.tar.gz
[me@linuxbox src]$ ls
# diction-1.11
# diction-1.11.tar.gz


## source tree

[me@linuxbox src]$ cd diction-1.11
[me@linuxbox diction-1.11]$ ls
# config.guess     diction.c          getopt.c      nl
# config.h.in      diction.pot        getopt.h      nl.po
# config.sub       diction.spec       getopt_int.h  README
# configure        diction.spec.in    INSTALL       sentence.c
# configure.in     diction.texi.in    install-sh    sentence.h
# COPYING en       Makefile.in        style.1.in
# de               en_GB              misc.c        style.c
# de.po            en_GB.po           misc.h        test
# diction.1.in     getopt1.c          NEWS


## GNU Project file

# the documentation files README, INSTALL, NEWS, and COPYING belong to GNU Project


## .c file

# the .c files contain the C programs supplied by the package divided into modules
[me@linuxbox diction-1.11]$ less diction.c


## .h file

# the .h files are known as header files
# when compiler to read the file getopt.h, it is in order to know what's in getopt.c
#include "getopt.h"

# in getopt.h, we see some include statement by the system to support in /usr/include/
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


## build code

# most program build code with two-command sequence
./configure
make


## ./configure

[me@linuxbox diction-1.11]$ ./configure
# checking libintl.h presence... yes
# checking for libintl.h... yes
# checking for library containing gettext... none required
# configure: creating ./config.status
# config.status: creating Makefile
# config.status: creating diction.1
# config.status: creating diction.texi
# config.status: creating diction.spec
# config.status: creating style.1
# config.status: creating test/rundiction
# config.status: creating config.h
# [me@linuxbox diction-1.11]$

# ./configure create many files, the most important one is Makefile
# makefile is a configuration file that instructs the make command
#   how to build the program


## make

[me@linuxbox diction-1.11]$ make
[me@linuxbox diction-1.11]$ ls
# config.guess  de.po             en              en_GB           sentence.c
# config.h      diction           en_GB.mo        en_GB.po        sentence.h
# config.h.in   diction.1         getopt1.c       getopt1.o       sentence.o
# config.log    diction.1.in      getopt.c        getopt.h        style
# config.status diction.c         getopt_int.h    getopt.o        style.1
# config.sub    diction.o         INSTALL         install-sh      style.1.in
# configure     diction.pot       Makefile        Makefile.in     style.c
# configure.in  diction.spec      misc.c          misc.h          style.o
# COPYING       diction.spec.in   misc.o          NEWS            test
# de            diction.texi      nl              nl.mo
# de.mo         diction.texi.i    nl.po           README

# make only builds what needs building

# if we build by using make again
[me@linuxbox diction-1.11]$ make
# make: Nothing to be done for `all'.

# if we delete part of code, then build by using make
[me@linuxbox diction-1.11]$ rm getopt.o
[me@linuxbox diction-1.11]$ make
# we will see that make rebuilds it
# and re-links the diction and style programs


## make install

[me@linuxbox diction-1.11]$ sudo make install
# After we perform the installation, we can check that the program is ready to go:
[me@linuxbox diction-1.11]$ which diction
# /usr/local/bin/diction
[me@linuxbox diction-1.11]$ man diction
# And there we have it!
