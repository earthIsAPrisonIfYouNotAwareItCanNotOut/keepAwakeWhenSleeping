#include <iostream>
int main()
{
    // assign one arithmetic type to another

    bool b = 42;            // b is true
    int i = b;              // i has value 1
    i = 3.14;               // i has value 3
    double pi = i;          // pi has value 3.0
    unsigned char c = -1;   // assuming 8-bit chars, c has value 255
    signed char c2 = 256;   // assuming 8-bit chars, the value of c2 is undefined

    int i = 42;
    if (i) // condition will evaluate as true
        i = 0;

    // expression involving unsigned types

    unsigned u = 10;
    int i = -42;
    std::cout << i + i << std::endl;  // prints -84
    std::cout << u + i << std::endl;  // if 32-bit ints, prints 4294967264

    unsigned u1 = 42, u2 = 10;
    std::cout << u1 - u2 << std::endl; // ok: result is 32
    std::cout << u2 - u1 << std::endl; // ok: but the result will wrap around

    // WRONG: u can never be less than 0; the condition will always succeed
    for (unsigned u = 10; u >= 0; --u)
        std::cout << u << std::endl;
}
