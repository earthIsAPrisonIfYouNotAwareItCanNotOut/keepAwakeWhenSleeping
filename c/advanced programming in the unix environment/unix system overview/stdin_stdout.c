/*
  The apue.h include header <unistd.h>
  the header <unistd.h> cocntains many function prototypes such as read and write
  the header <unistd.h> defined constants /STDIN_FILENO/ and /STDOUT_FILENO/
  STDIN_FILENO and STDOUT_FILENO specify the /file descriptors/ for standard input and sttandard output
*/

#include "apue.h"

#define	BUFFSIZE	4096  /* the various values of BUFFSIZE will affect the efficiency of the program */

int
main(void)
{
        int		n;
        char	buf[BUFFSIZE];

        /*
          read function returns the number of bytes that are read, and this value is used as the number of bytes to write
        */
        while ((n = read(STDIN_FILENO, buf, BUFFSIZE)) > 0)  /* encounter the end of the input file, read returns 0 and the program stops If a read error occurs, read return -1 */
                if (write(STDOUT_FILENO, buf, n) != n)
                        err_sys("write error");

        if (n < 0)
                err_sys("read error");

        exit(0);
}
