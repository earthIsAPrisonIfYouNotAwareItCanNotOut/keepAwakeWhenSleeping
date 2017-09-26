#include <iostream>
int main()
{
    // typedef

    typedef double wages;   // wages is a synonym for double
    typedef wages base, *p; // base is a synonym for double, p for double*

    // using

    using SI = Sales_item;  // SI is a synonym for Sales_item

    // type name

    wages hourly, weekly;  // same as double hourly, weekly
    SI item;               // same as Sales_item item

    // compound type

    // the declarations use the type pstring
    //   which is an alias for the type char*
    // the base type in declarations is const pstring
    // so, const pstring is a constant pointer to char
    //   not a pointer to const char

    typedef char *pstring;
    const pstring cstr = 0; // cstr is a constant pointer to char
    const pstring *ps;      // ps is a pointer to a constant pointer to char

    // alias error

    // when we use cstr alias
    //   declare cstr as a const pointer to cstr
    // but the base type make cstr as
    //   a pointer to const cstr

    const char *cstr = 0;  // wrong interpretation of const pstring cstr
}
