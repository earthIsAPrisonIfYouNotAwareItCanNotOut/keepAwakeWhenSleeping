// header file
#include <iostream>
#include "Sales_item.h"

int main()
{
    Sales_item book;
    // read ISBN, number of copies sold, and sales price
    std::cin >> book;
    // write ISBN, number of copies sold, total revenue, and average price
    std::cout << book << std::endl;
    return 0;
}
// If the input to this program is
//   0-201-70353-X 4 24.99
// then the output will be
//   0-201-70353-X 4 99.96 24.99
