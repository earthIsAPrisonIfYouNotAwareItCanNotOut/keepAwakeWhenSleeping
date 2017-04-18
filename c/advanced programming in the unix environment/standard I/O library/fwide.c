#include <stdio.h>
#include <wchar.h>
/*
  FILE *fp: a pointer to a FILE object
            this object is normally a structure that contains all the information required by the standard I/O library to manage the stream
  int mode: positive if stream is wide oriented
            negative if stream is byte oriented
            or 0 if stream has no orientation
*/
int fwide(FILE *fp, int mode);
