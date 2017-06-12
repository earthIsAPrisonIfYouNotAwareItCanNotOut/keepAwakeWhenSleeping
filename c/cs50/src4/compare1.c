#include <cs50.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    printf("s: ");
    char *s = get_string();          // char *
 
    printf("t: ");
    char *t = get_string();          // char *
 
    if (s != NULL && t != NULL)
    {
        if (strcmp(s, t) == 0)       // strcmp
        {
            printf("same\n");
        }
        else
        {
            printf("different\n");
        }
    }
}
