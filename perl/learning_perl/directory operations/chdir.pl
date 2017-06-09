# it's just like the shell's cd command
chdir '/etc' or die "cannot chdir to /etc: $!";
# perl sets the value of $! if an error occurs
# if you call chdir without an argument, perl determines your home directory as default

# TIP
# try File::HomeDir module to help you specify home directory in a mostly portable fashion
