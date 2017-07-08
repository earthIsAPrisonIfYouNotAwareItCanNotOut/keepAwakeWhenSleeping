#include <iostream>
#include "Sales_item.h"
int main()
{
    Sales_item item1, item2;
    std::cin >> item1 >> item2;   // read a pair of transactions
    std::cout << item1 + item2 << std::endl; // print their sum
    return 0;
}
// input
//   0-201-78345-X 3 20.00
// 0-201-78345-X 2 25.00
// output
//   0-201-78345-X 5 110 22

// using file redirection
//   $ addItems <infile >outfile
