#include <iostream>

int main()
{
    // cannot change

    // because we cannot assign directly to ci
    //   we also should not be able to use a reference to change ci

    const int ci = 1024;
    const int &r1 = ci;   // ok: both reference and underlying object are const
    r1 = 42;              // error: r1 is a reference to const
    int &r2 = ci;         // error: non const reference to a const object


    // initialization and reference to const

    int i = 42;
    const int &r1 = i;      // we can bind a const int& to a plain int object
    const int &r2 = 42;     // ok: r1 is a reference to const
    const int &r3 = r1 * 2; // ok: r3 is a reference to const
    int &r4 = r * 2;        // error: r4 is a non const reference

    // the easiest way to understand
    //   this difference in initialization rules
    //   is to consider what happens
    //   when we bind a reference to an object of a different type

    double dval = 3.14;
    const int &ri = dval;

    // here ri refers to an int
    //   operations on ri will be integer operations
    //   but dval is a floating-point number, not an integer
    // to ensure that the object to which ri is bound is an int
    //   the compiler transforms this code into something like

    const int temp = dval;   // create a temporary const int from the double
    const int &ri = temp;    // bind ri to that temporary

    // ri actually reference to a temporary
    //   which is convert from double to int


    // a reference to const may refer to an object that is not const

    // binding r2 to the nonconst int i is legal
    // however, we cannot use r2 to change i
    // even so, the value in i still might change
    //   we can change i by assigning to it directly
    //   or by assigning to another reference bound to i, such as r1

    int i = 42;
    int &r1 = i;          // r1 bound to i
    const int &r2 = i;    // r2 also bound to i; but cannot be used to change i
    r1 = 0;               // r1 is not const; i is now 0
    r2 = 0;               // error: r2 is a reference to const
}
