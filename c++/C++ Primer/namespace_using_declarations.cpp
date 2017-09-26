#include <iostream>

/// using declaration

// the using declarations for cin, cout, and endl mean that
//   we can use those names without the std:: prefix

// we can put each using declaration on its own line or
//   combine several onto a single line

// NOTE
// each declaration must end in a semicolon

// using declarations for names from the standard library
using std::cin;
using std::cout; using std::endl;

int main()
{
    cout << "Enter two numbers:" << endl;
    int v1, v2;
    cin >> v1 >> v2;
    cout << "The sum of " << v1 << " and " << v2
         << " is " << v1 + v2 << endl;
    return 0;
}
