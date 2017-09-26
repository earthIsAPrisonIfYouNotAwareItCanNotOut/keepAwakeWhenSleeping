#include <iostream>
int main()
{
    // decltype

    // here the compiler does not call f
    // but it uses the type that such a call would return as teh type for sum

    decltype(f()) sum = x; // sum has whatever type f returns

    // return type

    // because ci is a reference, decltype(cj) is a reference type
    // like any other reference, z must be initialized

    const int ci = 0, &cj = ci;
    decltype(ci) x = 0; // x has type const int
    decltype(cj) y = x; // y has type const int& and is bound to x
    decltype(cj) z;     // error: z is a reference and must be initialized

    // reference and decltype

    // here r is a reference
    //   so decltype(r) is a reference type
    //   if we want the type to which r refers
    //     we can use r in an expression, such as r + 0
    // when we dereference a pointer
    //   we get the object to which the pointer points
    //   moreover, we can assign to that object
    //   thus, the type deduced by decltype(*p) is int&, not plain int

    // decltype of an expression can be a reference type
    int i = 42, *p = &i, &r = i;
    decltype(r + 0) b;  // ok: addition yields an int; b is an (uninitialized) int
    decltype(*p) c;     // error: c is int& and must be initialized

    // the expression in decltype

    // decltype of a parenthesized variable is always a reference
    decltype((i)) d;    // error: d is int& and must be initialized
    decltype(i) e;      // ok: e is an (uninitialized) int
}
