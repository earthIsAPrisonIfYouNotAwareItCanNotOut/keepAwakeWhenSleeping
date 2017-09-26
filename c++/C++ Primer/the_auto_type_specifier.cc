#include <iostream>
int main()
{
    // auto

    // if val1 and val2 are Sale_item objects
    //   item will have type Sales_item

    // the type of item is deduced from the type of the result of adding val1 and val2
    auto item = val1 + val2; // item initialized to the result of val1 + val2

    // a single base type

    auto i = 0, *p = &i;    // ok: i is int and p is a pointer to int
    auto sz = 0, pi = 3.14; // error: inconsistent types for sz and pi

    // use a reference as an initializer

    int i = 0, &r = i;
    auto a = r; // a is an int (r is an alias for i, which has type int)

    // drop top-level

    const int ci = i, &cr = ci;
    auto b = ci;  // b is an int (top-level const in ci is dropped)
    auto c = cr;  // c is an int (cr is an alias for ci whose const is top-level)
    auto d = &i;  // d is an int*(& of an int object is int*)
    auto e = &ci; // e is const int*(& of a const object is low-level const)

    // if we want the deduced type to have a top-level
    //   we must say so explicitly

    const auto f = ci; // deduced type of ci is int; f has type const int

    // reference to auto

    auto &g = ci;       // g is a const int& that is bound to ci
    auto &h = 42;       // error: we can't bind a plain reference to a literal
    const auto &j = 42; // ok: we can bind a const reference to a literal

    // & and * in auto

    auto k = ci, &l = i;    // k is int; l is int&
    auto &m = ci, *p = &ci; // m is a const int&;p is a pointer to const int
    // error: type deduced from i is int; type deduced from &ci is const int
    auto &n = i, *p2 = &ci;
}
