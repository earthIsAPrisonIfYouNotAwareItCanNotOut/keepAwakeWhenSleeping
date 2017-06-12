#include <cs50.h>
#include <stdio.h>

int main(void)
{
    string s = get_string();
    int n = 0;
    while (s[n] != '\0')           // the end of string
    {
        n++;
    }
    printf("%i\n", n);
}
