## printenv

# Print part or all of the environment

# see a list of environment variables
$ printenv | less
KDE_MULTIHEAD=false
SSH_AGENT_PID=6666
HOSTNAME=linuxbox
GPG_AGENT_INFO=/tmp/gpg-PdOt7g/S.gpg-agent:6689:1
SHELL=/bin/bash
...

# specify environment variables
$ printenv USER
me

## set

# Set shell options

# when used without options or arguments
# will display both the shell and environment variables
$ set | less

## alias

# Create an alias for a command

$ alias
alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'


## how to create (modify) shell environment

# Startup Files For Login Shell Session
/etc/profile        # A global configuration script that applies to all users
~/.bash_profile     # A user's personal startup file
                    # Can be used to extend or override settings
                    #   in the global configuration script
~/.bash_login       # If ~/.bash_profile is not found
                    # bash attempts to read this script
~/.profile          # If neither ~/.bash_profile nor ~/.bash_login is found
                    # bash attempts to read this file
                    # This is the default in Debian-based distributions, such as Ubuntu.

# Startup Files For Non-Login Shell Sessions
/etc/bash.bashrc    # A global configuration script that applies to all users
~/.bashrc           # A user's personal startup file

# .bash_profile

# If the file ~/.bashrc exists, then
#   read the ~/.bashrc file.
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# PATH is modified to add the directory $HOME/bin to the end of the list
$ foo="This is some"
$ echo $foo
This is some
$ foo="$foo text."
$ echo $foo
This is some text.

# The export command tells the shell
#   to make the contents of PATH available to child processes of this shell
export PATH

# source

# after doing something, we should be able to see the effect of our changes
$ source .bashrc
