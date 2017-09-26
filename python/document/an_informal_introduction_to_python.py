# act as a simple calculator

# the operators +, -, * and / work just like most other languages

# >>> 2 + 2
# 4
# >>> 50 - 5*6
# 20
# >>> (50 - 5*6) / 4
# 5.0
# >>> 8 / 5  # division always returns a floating point number
# 1.6

# division (/) always returns a float
#   and get an integer result you can use //
#   get the remainder you can use %

# >>> 17 / 3     # classic division returns a float
# 5.666666666666667
# >>>
# >>> 17 // 3    # floor division discards the fractional part
# 5
# >>> 17 % 3     # the % operator returns the remainder of the division
# 2
# >>> 5 * 3 + 2  # result * divisor + remainder
# 17
# - it is possible to use the ** operator to calculate power
# >>> 5 ** 2     # 5 squared
# 25
# >>> 2 ** 7     # 2 to the power of 7
# 128


# the variable _

# when you using python as a desk calculator
#   it is somewhat easier to continue calculations

# >>> tax = 12.5 / 100
# >>> price = 100.50
# >>> price * tax
# 12.5625
# >>> price + _
# 113.0625
# >>> round(_, 2)
# 113.06


# double quote && single quote && escape

# >>> '"Isn\'t," she said.'
# "Isn\'t," she said.'
# >>> print('"Isn\'t," she said.')
# "Isn't," she said.
# >>> s = 'First line.\nSecond line.'  # \n means newline
# >>> s  # without print(), \n is included in the output
# 'First line.\nSecond line.'
# >>> print(s)  # with print(), \n produces a new line
# First line.
# Second line.


# raw strings

# >>> print('C:\some\name')  # here \n means newline!
# C:\some
# ame
# >>> print(r'C:\some\name')  # note the r before the quote
# C:\some\name


# multiple lines strings

# One way is using triple-quotes: """...""" or '''...'''

print("""\
Usage: thingy [OPTIONS]
    -h                        Display this usage message
    -H hostname               Hostname to connect to
""")


# string can be concatenated and repeated

# concatenated with + and repeated with *

# >>> # 3 times 'un', followed by 'ium'
# >>> 3 * 'un' + 'ium'
# 'unununium'
# >>> prefix = 'Py'
# >>> prefix + 'thon'
# 'Python'


# string can be indexed

# with the first character having index 0
#   a character is simply a string of size one
# negative indices start from -1

# >>> word = 'Python'
# >>> word[0]   # character in position 0
# 'P'
# >>> word[5]   # character in position 5
# 'n'
# >>> word[-1]  # last character
# 'n'
# >>> word[-2]  # second-last character
# 'o'
# >>> word[-6]
# 'P'


# slice is also supported

# slicing allows you to obtain substring

# >>> word[0:2]  # characters from position 0 (included) to 2 (excluded)
# 'Py'
# >>> word[2:5]  # characters from position 2 (included) to 5 (excluded)
# 'tho'

# the start is always included, and the end always excluded

# >>> word[:2] + word[2:]
# 'Python'
# >>> word[:4] + word[4:]
# 'Python'
# >>> word[-2:]  # characters from the second-last (included) to the end
# 'on'

# one way to remenber how slices work
# +-----+---+---+---+---+---+
# | P | y | t | h | o | n |
# +---+-----+---+---+---+---+
# 0   1   2   3   4   5   6
# 6  -5  -4  -3  -2  -1

# NOTE
# attempting to use an index that is too large will result in an error

# >>> word[42]  # the word only has 6 characters
# Traceback (most recent call last):
#   File "<stdin>", line 1, in <module>
# IndexError: string index out of range

# out of range slice indexs are handled gracefully when used for slicing

# >>> word[4:42]
# 'on'
# >>> word[42:]
# ''


# string cannot be changed

# >>> word[0] = 'J'
#   ...
# TypeError: 'str' object does not support item assignment
# >>> word[2:] = 'py'
#   ...
# TypeError: 'str' object does not support item assignment

# if you need a different string, you should create a new one

# >>> 'J' + word[1:]
# 'Jython'
# >>> word[:2] + 'py'
# 'Pypy'


# group data types

# Lists might contain items of different types
#   but usually the items all have the same type

# >>> squares = [1, 4, 9, 16, 25]
# >>> squares
# [1, 4, 9, 16, 25]


# indexed and sliced

# >>> squares[0]    # indexing returns the item
# 1
# >>> squares[-1]
# 25
# >>> squares[-3:]  # slicing returns a new list
# [9, 16, 25]
# >>> squares[:]
# [1, 4, 9, 16, 25]


# mutable

# >>> squares + [36, 49, 64, 81, 100]
# [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
# >>> cubes = [1, 8, 27, 65, 125]  # something's wrong here
# >>> 4 ** 3  # the cube of 4 is 64, not 65!
# 64
# >>> cubes[3] = 64  # replace the wrong value
# >>> cubes
# [1, 8, 27, 64, 125]

# >>> cubes.append(216)  # add the cube of 6
# >>> cubes.append(7 ** 3)  # and the cube of 7
# >>> cubes
# [1, 8, 27, 64, 125, 216, 343]

# >>> letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
# >>> letters
# ['a', 'b', 'c', 'd', 'e', 'f', 'g']
# >>> # replace some values
# >>> letters[2:5] = ['C', 'D', 'E']
# >>> letters
# ['a', 'b', 'C', 'D', 'E', 'f', 'g']
# >>> # now remove them
# >>> letters[2:5] = []
# >>> letters
# ['a', 'b', 'f', 'g']
# >>> # clear the list by replacing all the elements with an empty list
# >>> letters[:] = []
# >>> letters
# []
# - the build-in function len()
# >>> letters = ['a', 'b', 'c', 'd']
# >>> len(letters)
# 4


# nest list

# >>> a = ['a', 'b', 'c']
# >>> n = [1, 2, 3]
# >>> x = [a, n]
# >>> x
# [['a', 'b', 'c'], [1, 2, 3]]
# >>> x[0]
# ['a', 'b', 'c']
# >>> x[0][1]
# 'b'


# Fibonacci series

# >>> # Fibonacci series:
# ... # the sum of two elements defines the next
# ... a, b = 0, 1    # multiple assignment
# ... # the body of loop within a basic block
# ... #   must be indented by the same amount
# >>> while b < 10:
# ...     print(b)
# ...     a, b = b, a+b
# ...     # the keyword 'end' can be used to avoid the newline after the output
# ...     # print(b, end=',')   will ouput  1,1,2,3,5,8
# ...
# 1
# 1
# 2
# 3
# 5
# 8
