## display process

# ps
# Report a snapshot of current processes

# TTY is short for “Teletype,”
#   and refers to the controlling terminal for the process
$ ps
PID   TTY     TIME      CMD
5198  pts/1   00:00:00  bash
10129 pts/1   00:00:00  ps

# Adding the “x” option
#   tells ps to show all of our processes
#   regardless of what terminal (if any) they are controlled by
# The presence of a “? ” in the TTY column
#   indicates no controlling terminal
$ ps x
PID TTY   STAT   TIME COMMAND
2799 ?    Ssl    0:00 /usr/libexec/bonobo-activation-server –ac
2820 ?    Sl     0:01 /usr/libexec/evolution-data-server-1.10 --

# STAT
# reveal the current status of the process
# process states
# R   running
# S   sleep
# T   stop
# Z   zombie process
# <   high priority
# N   low priority

# BSD style
# user ID : cpu usage : memory usage : virtual memory :
# resident set size : time when the process started
$ ps aux
USER   PID  %CPU  %MEM     VSZ    RSS  TTY   STAT   START   TIME  COMMAND
root     1   0.0   0.0    2136    644  ?     Ss     Mar05   0:31  init
root     2   0.0   0.0       0      0  ?     S&lt;     Mar05   0:00  [kt]


## control process

# &
# To launch a program so that it is immediately placed in the background
$ xlogo &
[1] 28236

# jos
# see the background program list
$ jobs
[1]+ Running            xlogo &
# NOTE
# A process in the background is immune from keyboard input
#   including any attempt interrupt it with a Ctrl-c

# fg
# To return a process to the foreground
$ jobs
[1]+ Running        xlogo &
$ fg %1
xlogo

# kill
# to “kill” programs
$ xlogo &
[1] 13546
$ kill -1 13546     # kill [-signal] PID...
[1]+ Hangup         xlogo
# common signals
# 1  HUP  Hangup
# 2  INT  interrupt
# 9  KILL kill
# 15 TERM terminate
# 18 CONT continue
# 19 STOP stop
