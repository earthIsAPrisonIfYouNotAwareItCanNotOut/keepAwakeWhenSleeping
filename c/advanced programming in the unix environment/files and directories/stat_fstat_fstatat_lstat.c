#include <sys/stat.h>
/*
  all four return: 0 if ok, -1 on error
  gicen a pathname:
    the stat function returns a structure of information about the named file
    the fstat function obtains information about the file that is already open on the descriptor fd
    the lstat function is similar to stat, but when the named file is a symbolic link, lstat returns information about the symbolic link
  the buf argument is a pointer to a structure, the definition of the structure is in En 128
*/
int stat(const char *restrict pathname, struct stat *restrict buf );
int fstat(int fd, struct stat *buf);
int lstat(const char *restrict pathname, struct stat *restrict buf );
int fstatat(int fd, const char *restrict pathname, struct stat *restrict buf, int flag);
