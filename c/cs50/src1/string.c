#include <cs50.h>               // customized library
#include <stdio.h>

int main(void)
{
    printf("Name: ");           // improving UX (user experience)
    string s = get_string();    // customized variable
    printf("hello, %s\n", s);   // format syntax
}
