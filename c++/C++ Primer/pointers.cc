#include <iostream>

int main()
{
    // *

    int *ip1, *ip2;  // both ip1 and ip2 are pointers to int
    double dp, *dp2; // dp2 is a pointer to double; dp is a double

    // &

    int ival = 42;
    int *p = &ival; // p holds the address of ival; p is a pointer to ival

    // type matched

    double dval;
    double *pd = &dval;  // ok: initializer is the address of a double
    double *pd2 = pd;    // ok: initializer is a pointer to double
    int *pi = pd;  // error: types of pi and pd differ
    pi = &dval;    // error: assigning the address of a double to a pointer to int

    // using a pointer points to an object

    int ival = 42;
    int *p = &ival; // p holds the address of ival; p is a pointer to ival
    cout << *p;     // * yields the object to which p points; prints 42

    *p = 0;     // * yields the object; we assign a new value to ival through p
    cout << *p; // prints 0

    // some symbols have multiple meanings

    int i = 42;
    int &r = i;   // & follows a type and is part of a declaration; r is a reference
    int *p;       // * follows a type and is part of a declaration; p is a pointer
    p = &i;       // & is used in an expression as the address-of operator
    *p = i;       // * is used in an expression as the dereference operator
    int &r2 = *p; // & is part of the declaration; * is the dereference operator

    // null pointers

    int *p1 = nullptr; // equivalent to int *p1 = 0;
    int *p2 = 0;       // directly initializes p2 from the literal constant 0
    // must #include cstdlib
    int *p3 = NULL;    // equivalent to int *p3 = 0;

    int zero = 0;
    pi = zero;        // error: cannot assign an int to a pointer

    // assignment and pointers

    int i = 42;
    int *pi = 0;   // pi is initialized but addresses no object
    int *pi2 = &i; // pi2 initialized to hold the address of i
    int *pi3;      // if pi3 is defined inside a block, pi3 is uninitialized
    pi3 = pi2;     // pi3 and pi2 address the same object, e.g., i
    pi2 = 0;       // pi2 now addresses no object

    pi = &ival;    // value in pi is changed; pi now points to ival

    *pi = 0;       // value in ival is changed; pi is unchanged

    // other pointer operations

    int ival = 1024;
    int *pi = 0;      // pi is a valid, null pointer
    int *pi2 = &ival; // pi2 is a valid pointer that holds the address of ival
    if (pi)  // pi has value 0, so condition evaluates as false
        // ...
    if (pi2) // pi2 points to ival, so it is not 0; the condition evaluates as true
        // ...

    // void* pointers

    double obj = 3.14, *pd = &obj;
    // ok: void* can hold the address value of any data pointer type
    void *pv = &obj;  // obj can be an object of any type
    pv = pd;          // pv can hold a pointer to any type
}
