#include <iostream>

int main()
{
    // constant expressions

    // although staff_size is initialized from a literal
    //   it is not a constant expression because it is a plain int
    //   not a const int
    // even though sz is a const
    //   the value of its initalizer is not known until run time
    //   hence, sz is not a contant expression

    const int max_files = 20;    // max_files is a constant expression
    const int limit = max_files + 1; // limit is a constant expression
    int staff_size = 27;       // staff_size is not a constant expression
    const int sz = get_size(); // sz is not a constant expression

    // constexpr variables

    // although we cannot use an ordinary function
    //   as an initializer for a constexpr variable
    // the new standard lets us define certain functions as constexpr
    //   such functions must be simple enough that
    //     the compiler can evaluate them at compile time
    //   we can use constexpr functions in the initializer of a constexpr variable

    constexpr int mf = 20;        // 20 is a constant expression
    constexpr int limit = mf + 1; // mf + 1 is a constant expression
    constexpr int sz = size();    // ok only if size is a constexpr function

    // pointers and constexpr

    // the difference between q and p is
    //   constexpr imposes a top-level const on the objects it defines

    const int *p = nullptr;     // p is a pointer to a const int
    constexpr int *q = nullptr; // q is a const pointer to int

    // like any other constant pointer
    //   a constexpr pointer may point to a const or a nonconst type

    constexpr int *np = nullptr; // np is a constant pointer to int that is null
    int j = 0;
    constexpr int i = 42;  // type of i is const int
    // i and j must be defined outside any function
    constexpr const int *p = &i; // p is a constant pointer to the const int i
    constexpr int *p1 = &j;      // p1 is a constant pointer to the int j
}
