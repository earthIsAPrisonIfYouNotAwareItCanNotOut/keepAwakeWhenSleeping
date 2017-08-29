#include <iostream>

int main()
{
    // type modification

    // i is an int; p is a pointer to int; r is a reference to int
    int i = 1024, *p = &i, &r = i;

    // the base type of this declaration is int, not int*
    //   the * modifies the type of p
    int* p;        // legal but might be misleading

    // TIP
    // the important thing is to chose a style and use it consistently
    int* p1, p2;   // p1 is a pointer to int; p2 is an int
    int *p1, *p2;  // both p1 and p2 are pointers to int

    // defines only one variable per statement
    int* p1;       // p1 is a pointer to int
    int* p2;       // p2 is a pointer to int

    // pointers to pointers

    // here pi is a pointer to an int and ppi is a pointer to a pointer to an int
    // ppi -> pi -> ival (1024)
    int ival = 1024;
    int *pi = &ival;    // pi points to an int
    int **ppi = &pi;    // ppi points to a pointer to an int

    // dereference

    // this program prints the value of ival three different ways
    //   first, directly
    //   then, through the pointer to int in pi
    //   and finally, by dereferencing ppi twice to get to the underlying value in ival
    cout << "The value of ival\n"
         << "direct value: " << ival << "\n"
         << "indirect value: " << *pi << "\n"
         << "doubly indirect value: " << **ppi
         << endl;

    // references to pointers

    // the easiest way to understand the type of r
    //   is to read the definition right to left
    // the symbol closest to the name of the variable (the & in &r)
    //    is the one that has the most immediate effect on the variable's type
    //    thus, we know that r is a reference
    // the rest of the declarator determines the type to which r refers
    //   the next symbol * in this case
    //     says that the type r refers to is a pointer type
    //   finally, the base type of the declaration
    //     says that r is a reference to a pointer to an int
    int i = 42;
    int *p;        // p is a pointer to int
    int *&r = p;   // r is a reference to the pointer p
    r = &i; // r refers to a pointer; assigning &i to r makes p point to i
    *r = 0; // dereferencing r yields i, the object to which p points; changes i to 0
}
