/*
  the limitation of this program is that we can't pass arguments to the command we execute
*/
#include "apue.h"
#include <sys/wait.h>

int
main(void)
{
        char	buf[MAXLINE];	/* from apue.h */
        pid_t	pid;
        int		status;

        printf("%% ");	/* print prompt (printf requires %% to print %) */
        while (fgets(buf, MAXLINE, stdin) != NULL) { /* use fgets to read one line at a time, we can use ctrl+D to return a null pointer, the process terminates */
                if (buf[strlen(buf) - 1] == '\n')
                        buf[strlen(buf) - 1] = 0; /* replace newline with null */

                if ((pid = fork()) < 0) { /* We call fork to create a new process, which is a copy of the caller */
                        err_sys("fork error");
                } else if (pid == 0) {		/* child */
                  execlp(buf, buf, (char *)0);  /* this replaces the child process with the new program file, we call it spawning a new process */
                        err_ret("couldn't execute: %s", buf);
                        exit(127);
                }

                /* parent */
                if ((pid = waitpid(pid, &status, 0)) < 0) /* calling waitpid for parent to wait for the child to terminatethe pid argument is the process ID of the child */
                        err_sys("waitpid error");
                printf("%% ");
        }
        exit(0);
}
