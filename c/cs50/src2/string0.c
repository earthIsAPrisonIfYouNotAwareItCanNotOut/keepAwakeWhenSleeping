#include <cs50.h>                              // string
#include <stdio.h>
#include <string.h>                            // char

int main(void)
{
    string s = get_string();
    if (s != NULL)
    {
        for (int i = 0; i < strlen(s); i++)
        {
            printf("%c\n", s[i]);              // char
        }
    }
    // printf("hello, %s", s);                 // string
}
