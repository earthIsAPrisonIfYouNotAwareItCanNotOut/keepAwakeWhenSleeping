#include <iostream>

int main()
{
    // unchange values

    const double pi = 3.14;   // pi is const; its value may not be changed
    double *ptr = &pi;        // error: ptr is a plain pointer
    const double *cptr = &pi; // ok: cptr may point to a double that is const
    *cptr = 42;               // error: cannot assign to *cptr

    // exception of type match

    double dval = 3.14;       // dval is a double; its value can be changed
    cptr = &dval;             // ok: but can't change dval through cptr


    // const pointer

    // const pointer must be initialized, and once initialized
    //   its value may not be changed
    // we indicate that the pointer is const by putting the const after the *

    int errNumb = 0;
    int *const curErr = &errNumb;  // curErr will always point to errNumb
    const double pi = 3.14159;
    const double *const pip = &pi; // pip is a const pointer to a const object

    // change the object which pointer is point to

    // _pip_ is a const pointer to const
    //   neither the value of the object addressed by pip
    //   nor the address stored in pip can be changed
    // _curErr_ addresses a plain, nonconst int
    //   we can use curErr to change the value of errNumb

    *pip = 2.72;     // error: pip is a pointer to const
    // if the object to which curErr points (i.e., errNumb) is nonzero
    if (*curErr) {
        errorHandler();
        *curErr = 0; // ok: reset the value of the object to which curErr is bound
    }
}
