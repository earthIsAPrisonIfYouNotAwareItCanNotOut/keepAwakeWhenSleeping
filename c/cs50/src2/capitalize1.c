#include <cs50.h>
#include <ctype.h>                                     // toupper function
#include <stdio.h>
#include <string.h>

int main(void)
{
    string s = get_string();
    if (s != NULL)
    {
        for (int i = 0, n = strlen(s); i < n; i++)
        {
            if (islower(s[i]))
            {
                printf("%c", toupper(s[i]));           // toupper function
            }
            else
            {
                printf("%c", s[i]);
            }
        }
        printf("\n");
    }
}
