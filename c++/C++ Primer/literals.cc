#include <iostream>
int main()
{
    // integer

    20 /* decimal */    024 /* octal */    0x14 /* hexadecimal */

    // floating-point

    3.14159    3.14159E0    0.    0e0    .001

    // character and string

    'a'             // character literal
    "Hello World!"  // string literal

    // multiline string literal

    std::cout << "a really, really long string literal "
                 "that spans two lines" << std::endl;

    // escape sequences

    std::cout << '\n';        // prints a newline
    std::cout << "\tHi!\n";   // prints a tab followd by "Hi!" and a newline

    \7 (bell)    \12 (newline)    \40 (blank)
    \0 (null)    \115 ('M')       \x4d ('M')

    std::cout << "Hi \x4dO\115!\n";  // prints Hi MOM! followed by a newline
    std::cout << '\115' << '\n';     // prints M followed by a newline

    // specify the type of a literal

    L'a'     // wide character literal, type is wchar_t
    u8"hi!"  // utf-8 string literal (utf-8 encodes a Unicode character in 8 bits)
    42ULL    // unsigned integer literal, type is unsigned long long
    1E-3F    // single-precision floating-point literal, type is float
    3.14159L // extended-precision floating-point literal, type is long double

    // boolean and pointer literals

    bool test = false;
}
