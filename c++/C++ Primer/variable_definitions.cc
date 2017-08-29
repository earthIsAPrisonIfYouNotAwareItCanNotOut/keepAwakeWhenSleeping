#include <iostream>

int main()
{
    // std::string

    int sum = 0, value, // sum, value, and units_sold have type int
    units_sold = 0;     // sum and units_sold have initial value 0
    Sales_item item;    // item has type Sales_item (see § 1.5.1 (p. 20))
    // string is a library type, representing a variable-length sequence of characters
    std::string book("0-201-78345-X"); // book initialized from string literal

    // initializers

    // ok: price is defined and initialized before it is used to initialize discount
    double price = 109.99, discount = price * 0.16;
    // ok: call applyDiscount and use the return value to initialize salePrice
    double salePrice = applyDiscount(price, discount);

    // list initialization

    int units_sold = 0;
    int units_sold = {0};
    int units_sold{0};
    int units_sold(0);

    long double ld = 3.1415926536;
    int a{ld}, b = {ld}; // error: narrowing conversion required
    int c(ld), d = ld;   // ok: but value will be truncated

    // default initialization

    std::string empty;  // empty implicitly initialized to the empty string
    Sales_item item;    // default-initialized Sales_item object
}
