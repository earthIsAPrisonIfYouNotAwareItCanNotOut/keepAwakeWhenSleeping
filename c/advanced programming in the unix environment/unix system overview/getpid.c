#include "apue.h"

int
main(void)
{
        /*
          getpid returns a pid_t data type, We don’t know its size
          so have to cast the value to the largest data type and guarantee a long promotes portability
        */
        printf("hello world from process ID %ld\n", (long)getpid());  /*  */
        exit(0);
}
