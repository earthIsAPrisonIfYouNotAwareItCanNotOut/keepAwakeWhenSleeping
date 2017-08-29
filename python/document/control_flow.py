## if

# there anc be zero or more elif parts
#   and the else part is optional
#   the keyword 'elif' is short for 'else if'
# and is useful to avoid an if ... elif ... elif
#   sequence is a substitute for the switch ... case statement

>>> x = int(input("Please enter an integer: "))
Please enter an integer: 42
>>> if x < 0:
...     x = 0
...     print('Negative changed to zero')
... elif x == 0:         # 'elif' is short for 'else if'
...     print('Zero')
... elif x == 1:
...     print('Single')
... else:
...     print('More')
...
More


## for

## for loop strings

>>> # Measure some strings:
... words = ['cat', 'window', 'defenestrate']
>>> for w in words:
...     print(w, len(w))
...
cat 3
window 6
defenestrate 12

## modify the sequence

# it is recommended you use slice notation to first make a copy

>>> for w in words[:]:  # Loop over a slice copy of the entire list.
...     if len(w) > 6:
...         words.insert(0, w)
...
>>> words
['defenestrate', 'cat', 'window', 'defenestrate']


## range

# generate artithmetic progressions

>>> for i in range(5):
...     print(i)
...
0
1
2
3
4

## different step

range(5, 10)
5 through 9

range(0, 10, 3)
0, 3, 6, 9

range(-10, -100, -30)
-10, -40, -70

## iterate over the length of a sequence

>>> a = ['Mary', 'had', 'a', 'little', 'lamb']
>>> for i in range(len(a)):
...     print(i, a[i])
...
0 Mary
1 had
2 a
3 little
4 lamb

# a strange thing happens if you just print a range

>>> print(range(10))
range(0, 10)

# create lists from iterables

>>> list(range(5))
[0, 1, 2, 3, 4]


## break

>>> for n in range(2, 10):
...     for x in range(2, n):
...         if n % x == 0:
...             print(n, 'equals', x, '*', n//x)
...             break
...         else:
...             # loop fell through without finding a factor
...             print(n, 'is a prime number')
...
2 is a prime number
3 is a prime number
4 equals 2 * 2
5 is a prime number
6 equals 2 * 3
7 is a prime number
8 equals 2 * 4
9 equals 3 * 3

## continue

>>> for num in range(2, 10):
...     if num % 2 == 0:
...         print("Found an even number", num)
...         continue
...     print("Found a number", num)
Found an even number 2
Found a number 3
Found an even number 4
Found a number 5
Found an even number 6
Found a number 7
Found an even number 8
Found a number 9

## pass

# pass is used as a place-holder for a note or implement a new code

>>> while True:
...     pass  # Busy-wait for keyboard interrupt (Ctrl+C)
...

>>> def initlog(*args):
...     pass   # Remember to implement this!
...


## function

# write Fibonacci series up to n

# the keyword def introduces a function definition
# the first line of funcion body is the function's documentation string

>>> def fib(n):
...     """Print a Fibonacci series up to n."""
...     a, b = 0, 1
...     while a < n:
...         print(a, end=' ')
...         a, b = b, a+b
...     print()
...
>>> # Now call the function we just defined:
... fib(2000)
0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597

## rename function

# assigned function to another name

>>> fib
<function fib at 10042ed0>
>>> f = fib
>>> f(100)
0 1 1 2 3 5 8 13 21 34 55 89

## the return value of function
# a function without a return statement
#   but return a value 'None'

>>> fib(0)
>>> print(fib(0))
None

# a function that returns a list of numbers of the Fibanacci series

>>> def fib2(n):  # return Fibonacci series up to n
...     """Return a list containing the Fibonacci series up to n."""
...     result = []
...     a, b = 0, 1
...     while a < n:
...         result.append(a)    # see below
...         a, b = b, a+b
...     return result
...
>>> f100 = fib2(100)    # call it
>>> f100                # write the result
[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

## default argument values

# This function can be called in several ways:
#   giving only the mandatory argument: ask_ok('Do you really want to quit?')
#   giving one of the optional arguments: ask_ok('OK to overwrite the file?', 2)
#   or even giving all arguments:
#      ask_ok('OK to overwrite the file?', 2, 'Come on, only yes or no!')

def ask_ok(prompt, retries=4, reminder='Please try again!'):
    while True:
        ok = input(prompt)
        if ok in ('y', 'ye', 'yes'):
            return True
        if ok in ('n', 'no', 'nop', 'nope'):
            return False
        retries = retries - 1
        if retries < 0:
            raise ValueError('invalid user response')
        print(reminder)

# the default values are evaluated
#   at the point of function definition in the defining scope

i = 5
def f(arg=i):
    print(arg)
i = 6
f()
# will print 5.

# WARNING
# the default value is evaluated only once
# this makes a difference when the default is a mutable object such as a list

# the following function accumulates the arguments passed to it on subsequent calls

def f(a, L=[]):
    L.append(a)
    return L
print(f(1))
print(f(2))
print(f(3))

# This will print
# [1]
# [1, 2]
# [1, 2, 3]

# if you don't want the default value to be shared between subsequent calls

def f(a, L=None):
    if L is None:
        L = []
    L.append(a)
    return L

## keyword arguments

# the following function accepts
#   one required argument (voltage)
#   and three optional arguments (state, action, and type)

def parrot(voltage, state='a stiff', action='voom', type='Norwegian Blue'):
    print("-- This parrot wouldn't", action, end=' ')
    print("if you put", voltage, "volts through it.")
    print("-- Lovely plumage, the", type)
    print("-- It's", state, "!")

# This function can be called in any of the following ways:

parrot(1000)                                          # 1 positional argument
parrot(voltage=1000)                                  # 1 keyword argument
parrot(voltage=1000000, action='VOOOOOM')             # 2 keyword arguments
parrot(action='VOOOOOM', voltage=1000000)             # 2 keyword arguments
parrot('a million', 'bereft of life', 'jump')         # 3 positional arguments
parrot('a thousand', state='pushing up the daisies')  # 1 positional, 1 keyword

# but all the following calls would be invalid:

parrot()                     # required argument missing
parrot(voltage=5.0, 'dead')  # non-keyword argument after a keyword argument
parrot(110, voltage=220)     # duplicate value for the same argument
parrot(actor='John Cleese')  # unknown keyword argument

# all the keyword arguments passed
#   must match one of the arguments accepted by the function
#   this also includes non-optional arguments
# the keyword order is not important

# no argument may receive a value more than once
# here's an example that fails due to this restriction

>>> def function(a):
...     pass
...
>>> function(0, a=0)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: function() got multiple values for keyword argument 'a'

## formal parameter

def cheeseshop(kind, *arguments, **keywords):
    print("-- Do you have any", kind, "?")
    print("-- I'm sorry, we're all out of", kind)
    for arg in arguments:
        print(arg)
    print("-" * 40)
    for kw in keywords:
        print(kw, ":", keywords[kw])

# It could be called like this:

cheeseshop("Limburger", "It's very runny, sir.",
           "It's really very, VERY runny, sir.",
           shopkeeper="Michael Palin",
           client="John Cleese",
           sketch="Cheese Shop Sketch")

# and of course it would print:

-- Do you have any Limburger ?
-- I'm sorry, we're all out of Limburger
It's very runny, sir.
It's really very, VERY runny, sir.
----------------------------------------
client : John Cleese
shopkeeper : Michael Palin
sketch : Cheese Shop Sketch

## arbitrary argument lists

# any formal parameters
#   which occur after the *args parameter are 'value' like arguments
#   meaning that they can only be used as keywords rather than positional arguments

def write_multiple_items(file, separator, *args):
    file.write(separator.join(args))

>>> def concat(*args, sep="/"):
...     return sep.join(args)
...
>>> concat("earth", "mars", "venus")
'earth/mars/venus'
>>> concat("earth", "mars", "venus", sep=".")
'earth.mars.venus'

## unpacking argument lists

>>> list(range(3, 6))            # normal call with separate arguments
[3, 4, 5]
>>> args = [3, 6]
>>> list(range(*args))           # call with arguments unpacked from a list
[3, 4, 5]

>>> def parrot(voltage, state='a stiff', action='voom'):
...     print("-- This parrot wouldn't", action, end=' ')
...     print("if you put", voltage, "volts through it.", end=' ')
...     print("E's", state, "!")
...
>>> d = {"voltage": "four million", "state": "bleedin' demised", "action": "VOOM"}
>>> parrot(**d)
# -- This parrot wouldn't VOOM
# if you put four million volts through it.
# E's bleedin' demised !

## lambda expression

# lambda functions can reference variables from the containing scope

>>> def make_incrementor(n):
...     return lambda x: x + n
...
>>> f = make_incrementor(42)
>>> f(0)
42
>>> f(1)
43

# another use is to pass a small function as a argument

>>> pairs = [(1, 'one'), (2, 'two'), (3, 'three'), (4, 'four')]
>>> pairs.sort(key=lambda pair: pair[1])
>>> pairs
[(4, 'four'), (1, 'one'), (3, 'three'), (2, 'two')]

## documentation strings

>>> def my_function():
...     """Do nothing, but document it.
         ...
         ...     No, really, it doesn't do anything.
         ...     """
...     pass
...
>>> print(my_function.__doc__)

# Do nothing, but document it.
#
#     No, really, it doesn't do anything.

## function annotations

# The following example
#   has a positional argument
#       a keyword argument
#       and the return value annotated:

>>> def f(ham: str, eggs: str = 'eggs') -> str:
...     print("Annotations:", f.__annotations__)
...     print("Arguments:", ham, eggs)
...     return ham + ' and ' + eggs
...
>>> f('spam')
Annotations: {'ham': <class 'str'>, 'return': <class 'str'>, 'eggs': <class 'str'>}
Arguments: spam eggs
'spam and eggs'

## intermezzo coding style

# here are the most important points extracted for you
#   Use 4-space indentation, and no tabs
#     Tabs introduce confusion, and are best left out
#   Wrap lines so that they don’t exceed 79 characters
#     This helps users makes it possible to
#       have several code files side-by-side on larger displays
#   Use blank lines to separate functions and classes
#     and larger blocks of code inside functions
#   When possible, put comments on a line of their own
#   Use docstrings
#   Use spaces around operators and after commas
#     but not directly inside bracketing constructs: a = f(1, 2) + g(3, 4)
#   Name your classes and functions consistently
#     the convention is to use CamelCase
#       for classes and lower_case_with_underscores for functions and methods
#   Always use self as the name for the first method argument
#   Don’t use fancy encodings
#     if your code is meant to be used in international environments
#     Python’s default, UTF-8, or even plain ASCII work best in any case
#   don’t use non-ASCII characters in identifiers
