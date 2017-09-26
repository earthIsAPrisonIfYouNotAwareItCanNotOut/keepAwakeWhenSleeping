/// primitive types

// four of them are integer types
// two are floating-point number types
// one is the character type char
//   and one is a boolean

/// java integer types

// int    4 bytes
// short  2 bytes
// long   8 bytes
// byte   1 byte

/// floating-point types

// float    4 bytes
// double   8 bytes

/// the float type limit

// the limited precision of float
//   is simply not sufficient for many situations

/// the suffix F or f

// numbers of type float have a suffix F or f (for example, 3,14F)
// floating-point numbers without an F suffix (such as 3.14)
//   are always considered to be of type double
//   you can optionally supply the F or d suffix (for example, 3.14D)

/// three special floating-point errors

// positive infinity
// negative infinity
// NaN (not a number)

/// roundoff errors

// floating-point numbers are not suitable for financial calculation
//   in which roundoff errors cannot be tolerated
// System.out.println(2.0-1.0) prints 0.89999999999999
//   not 0.9 as you would expect
// there is no precise binary representation of the fraction 1/10
//   just as there is no accurate representation
//     of the fraction 1/3 in the decimal system

/// the char type

// the char type was originally intended to describe individual characters
//   however, there is no longer the case
// nowadays, some unicode characters can be described with one char value
//   and other unicode characters require two cahr values

/// literal values of char

// literal values of type char are enclosed in single quotes
// 'A' is a character constan with value 65
// "A" a string containing a single character

/// unicode sequences

// for example
//   \u2122 is the trademark symbol (™)
//   \u03C0 is the greek letter pi (π)
// public static void main (String\u005B\u005D args)
//   is prefectly legal
//   \u005B and \u005D are the encodings for [ and ]

/// escape sequence and unicode value

// escape sequence   name   unicode value
// \b    backspace          \u0008
// \t    tab                \u0009
// \n    linefeed           \u000a
// \r    carriage return    \u000d
// \"    double quote       \u0022
// \'    single quote       \u0027
// \\    backslash          \u005c

/// the unicode history

// in 1991, Unicdoe 1.0 was released
//   using available 65,536 code values
// unfortunately, over time, the inevitable happened
//   unicdoe grew beyond 65,536
//   primarily due to a very large of chinese, japanese, and korean
// to solve this, the utf-16 encoding represents
//   all unicode code points in a variable-length
//   the characters in the basic multilingual plane are represented as 16-bit values
//     called code units
//   the supplementary characters are encoded as consecutive pairs of code units
//   (U+D800 to U+DBFF for the first code unit, U+DC00 to U+DFFF for second)
//   for example, U+D835 and U+DD46 represemt the set of octonions
