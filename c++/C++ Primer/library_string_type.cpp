#include <string>
#include <iostream>

using std::string;
using std::cout; using std::cin; using std::endl;

int main()
{
    /// ways to initialize a string

    // string s1            default initialization, s1 is the empty string
    // string s2(s1)        s2 is a copy of s1
    // string s2 = s1       equivalent to s2(s1)
    // string s3("value")   s3 is a copy of the string literal
    // string s3 = "value"  equivalent to s3("value")
    // string s4(n, 'c')    initialize s4 with n copies of the character 'c'

    string s1;            // default initialization; s1 is the empty string
    string s2 = s1;       // s2 is a copy of  s1
    string s3 = "hiya";   // s3 is a copy of the string literal
    string s4(10, 'c');   // s4 is cccccccccc

    /// direct and copy forms of initialization

    // when we initialize a variable using =
    //   we are asking the compiler to
    //     copy initialize the object by
    //     copying the initializer on
    //     the right-hand side into the object being create

    string s5 = "hiya";          // copy initialization
    string s8 = string(10, 'c'); // copy initialization; s8 is cccccccccc
    string s6("hiya");   // direct initialization
    string s7(10, 'c');  // direct initialization; s7 is cccccccccc

    /// string operations

    // os << s        writes s onto output stream os, return os
    // is >> s        reads whitespace-separated string from is into s, returns is
    // getline(is,s)  reads a line of input from is into s, returns is
    // s.empty()      returns true if s is empty, otherwise returns false
    // s.size()       returns the number of characters in s
    // s[n]           returns a reference to the char at position n in s (start at 0)
    // s1 + s2        returns a string that is the concatenation of s1 and s2
    // s1 = s2        replaces characters in s1 with a copy of s2
    // s1 == s2       the strings s1 and s2 are equal if they contain the same characters
    // s1 != s2       equality is case-sensitive
    // <, <=, >, >=   comparisons are case-sensitive and use dictionary ordering

    /// reading and writing strings

    // NOTE
    // the string input operator reads and discards any leading whitespace
    //   it then reads characters until the next whitespace character is encountered

    // if the input to this program is "Hello World!"
    //   then the output will be "Hello"

    string s;           // empty string
    cin >> s;           // read a whitespace-separated string into s
    cout << s << endl;  // write s to the output
    return 0;

    // if we give the same input "Hello World!"
    //   our output would be "Hello World!"

    string s9, s10;
    cin >> s1 >> s2; // read first input into s1, second into s2
    cout << s9 << s10 << endl; // write both strings

    /// reading an unknown number of strings

    string word;
    while (cin >> word)        // read until end-of-file
        cout << word << endl;  // write each word followed by a new line
    return 0;

    /// using getline to read an entire line

    // NOTE
    // the newline that causes getline to return is discarded
    //   the newline is not stored in the string
    // so we use endl to end the current line and slush the buffer

    string line;
    // read input a line at a time until end-of-file
    while (getline(cin, line))
        cout << line << endl;
    return 0;

    /// the string empty and size operations

    // we can revise the previous program to only print lines that are not empty

    // read input a line at a time and discard blank lines
    while (getline(cin, line))
        if (!line.empty())
            cout << line << endl;

    // the size member returns the length of a string
    // we can use size to print only lines longer than 80 characters

    string line2;
    // read input a line at a time and print lines that are longer than 80 characters
    while (getline(cin, line2))
        if (line.size() > 80)
            cout << line << endl;

    /// the string::size_type type

    // the scope string say that the name size_type is defined in the string class
    // it is an unsigned type big enough to hold the size of any string
    // any variable used to store the result from _string size_ operation
    //   should be of type string::size_type

    // TIP
    // you can avoid problems due to conversion between _unsigned and _int_
    //   by not using _int_ in expressions that use size()

    /// comparing string

    // if two strings have different lengths
    //   and if every character in the shorter string is equal to
    //     the corresponding character of the longer string
    //   then the shorter string is less than the longer one
    // str < phrase

    // if any characters at corresponding positions in the two strings differ
    //   then the result of the string comparison is
    //     the result of comparing the first character at which the strings differ
    // slang > phrase > str

    string str = "Hello";
    string phrase = "Hello World";
    string slang = "Hiya";

    /// assignment for strings

    string st1(10, 'c'), st2; // st1 is cccccccccc, st2 is an empty string
    st1 = st2; // assignment: replace contents of st1 with a copy of st2
               // both st1 and st2 are now the empty string

    /// adding two strings

    // adding two strings yields a new string
    //   that is the concatenation of the left-hand followed by the right-hand operand

    string s11 = "hello, ", s12 = "world\n";
    string s13 = s11 + s12; // s3 is hello, world\m
    s11 += s12; // equivalent to s11 = s11 + s12

    /// adding literals and strings

    // the string library lets us convert
    //   both character literals and character string literals to strings

    string s14 = "hello", s15 = "world";  // no punctuation in s14 or s15
    string s16 = s14 + ", " + s15 + '\n';

    // at least one string object to each + operator must be of string type

    string s17 = s1 + ", ";           // ok: adding a string and a literal
    string s18 = "hello" + ", ";      // error: no string operand
    string s19 = s1 + ", " + "world"; // ok: each + has a string operand
    string s20 = "hello" + ", " + s2; // error: can't add string literals

    // together input or output group

    string s21 = (s11 + ", ") + "world"; // the subexpression s1 + ", " returns a string
    // is equal to
    string tmp = s1 + ", ";  // ok: + has a string operand
    s6 = tmp + "world";      // ok: + has a string operand

    string s22 = ("hello" + ", ") + s2; // error: can't add string literals

    // WARNING
    // for historical reasons and for compatibility with C
    // string literals are not standard library strings
    //   it is important to remember that these types differ
    //     when you use string literals and library strings
}
