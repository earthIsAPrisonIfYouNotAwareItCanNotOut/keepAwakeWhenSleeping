#include <iostream>

int main()
{
    // buffer size

    // defines bufSize as constant, any attempt to assign to bufSize is an error
    const int bufSize = 512;    // input buffer size
    bufSize = 512;              // error: attempt to write to const object

    // because we can't change the value of a const object after we create it
    //   it must be initialized
    //   as usual, the initializer may be an arbitratily complicated expression
    const int i = get_size();  // ok: initialized at run time
    const int j = 42;          // ok: initialized at compile time
    const int k;               // error: k is uninitialized const


    // initialization and const

    // when we use an object to initialize another object
    //   it doesn't matter whether either or both of the objects are const
    int i = 42;
    const int ci = i;    // ok: the value in i is copied into ci
    int j = ci;          // ok: the value in ci is copied into j
    // when we copy ci to initialize j
    //   we don't care that ci is a const


    // by default, const objects are local to a file

    // the compiler will generate code using the value 512
    //   in the place that our code use bufSize
    const int bufSize = 512;    // input buffer size

    // because bufSize is const
    //   we must specify extern in order for bufSize to be used in other files
    // the declaration in file1_1.h is also extern
    //   the extern signifies that bufSize is not local to this file
    //   and that its definition will occur elsewhere

    // file_1.cc defines and initializes a const that is accessible to other files
    extern const int bufSize = fcn();
    // file_1.h
    extern const int bufSize; // same bufSize as defined in file_1.cc
}
