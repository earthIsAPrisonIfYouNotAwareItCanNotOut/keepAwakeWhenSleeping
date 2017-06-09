## the simplest way to launch a child process

# invoke Unix data command
system 'date';

# in Windows, it will prompt you to enter a new data, use \T to suppress that
system 'date /T';


# type parameters in child process
system 'ls -l $HOME';   # not variable interpolate in single quote
system "ls -l \$HOME";  # escape $ if in double quote

# in Windows, use the dir command and the hashes don't interpolate in double quote
system "cmd /c dir %userprofile%";


## async child process

# use Unix facility to launch a background process
system "long_running_command with parameters &";

# in Windows, the start can run the command without program waiting for it
system 'start /B long_running_command with parameters';


## shell script

# Unix: prints the contents of all the (nonhidden) files in the current directory
system 'for i in *; do echo == $i ==; cat $i; done';

# Windows: The /R works recursively, so you might end up with a long list of files
system 'for /R %i in (*) DO echo %i & type %i';
