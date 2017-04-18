#include "apue.h"       /* This header includes some standard system headers and defines numerous constants and function prototypes */
#include <dirent.h>     /* to pick up the function prototypes for opendir and readdir */

/* ISO C */
int
main(int argc, char *argv[])
{
        DIR				*dp;
        struct dirent	*dirp;

        if (argc != 2)
                err_quit("usage: ls directory_name");

        if ((dp = opendir(argv[1])) == NULL)
                err_sys("can't open %s", argv[1]);
        while ((dirp = readdir(dp)) != NULL)
                printf("%s\n", dirp->d_name);

        closedir(dp);
        exit(0);
}
