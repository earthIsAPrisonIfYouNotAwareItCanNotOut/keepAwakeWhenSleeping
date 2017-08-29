#include <iostream>

int main()
{
    // &

    int ival = 1024;
    int &refVal = ival;  // refVal refers to (is another name for) ival
    int &refVal2;        // error: a reference must be initialized

    // a reference is an alias

    refVal = 2;      // assigns 2 to the object to which refVal refers, i.e., to ival
    int ii = refVal; // same as ii = ival

    // ok: refVal3 is bound to the object to which refVal is bound, i.e., to ival
    int &refVal3 = refVal;
    // initializes i from the value in the object to which refVal is bound
    int i = refVal; // ok: initializes i to the same value as ival

    // reference definitions

    int i = 1024, i2 = 2048;  // i and i2 are both ints
    int &r = i, r2 = i2;      // r is a reference bound to i; r2 is an int
    int i3 = 1024, &ri = i3;  // i3 is an int; ri is a reference bound to i3
    int &r3 = i3, &r4 = i2;   // both r3 and r4 are references

    int &refVal4 = 10;   // error: initializer must be an object
    double dval = 3.14;
    int &refVal5 = dval; // error: initializer must be an int object
}
