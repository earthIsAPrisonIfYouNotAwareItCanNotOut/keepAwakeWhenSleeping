#include <cs50.h>                    // header
#include <stdio.h>

void print_name(string name);        // predefined

int main(void)
{
    string s = get_string();
    print_name(s);
}

void print_name(string name)
{
    printf("hello, %s\n", name);
}
