# list data type

# list.append(x)          # add an item to the end of the list
# extend the list by appending all the items from the iterable
# list.extend(iterable)
# list.insert(i, x)       # insert an item at a given position
# list.remove(x)          # remove the value of x
# list.pop([i])           # remove and return the position of i
# list.clear()            # remove all items
# return zero-based index in the first item whose value of x
#   optional arguments start and end is used to limit the search
# list.index(x[, start[, end]])   invalid syntax
# list.count(x)           # return the number of times x appears in the list
# sort the items of the list in place
# list.sort(key=None, reverse=False)
# list.reverse()          # reverse the elements
# list.copy()

# the methods like insert, remove or sort that
#   only modify the list have no value printed
# this is a design principle for all mutable data structures in python

# >>> fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
# >>> fruits.count('apple')
# 2
# >>> fruits.count('tangerine')
# 0
# >>> fruits.index('banana')
# 3
# >>> fruits.index('banana', 4)  # Find next banana starting a position 4
# 6
# >>> fruits.reverse()
# >>> fruits
# ['banana', 'apple', 'kiwi', 'banana', 'pear', 'apple', 'orange']
# >>> fruits.append('grape')
# >>> fruits
# ['banana', 'apple', 'kiwi', 'banana', 'pear', 'apple', 'orange', 'grape']
# >>> fruits.sort()
# >>> fruits
# ['apple', 'apple', 'banana', 'banana', 'grape', 'kiwi', 'orange', 'pear']
# >>> fruits.pop()
# 'pear'


# using lists as stacks

# to add an item to the top of the stack, use append()
# to retrieve an item from the top of the stack
# use pop() without an explicit index

# >>> stack = [3, 4, 5]
# >>> stack.append(6)
# >>> stack.append(7)
# >>> stack
# [3, 4, 5, 6, 7]
# >>> stack.pop()
# 7
# >>> stack
# [3, 4, 5, 6]
# >>> stack.pop()
# 6
# >>> stack.pop()
# 5
# >>> stack
# [3, 4]


# using lists as queues

# however, lists are not efficient for this purpose

# >>> from collections import deque
# >>> queue = deque(["Eric", "John", "Michael"])
# >>> queue.append("Terry")           # Terry arrives
# >>> queue.append("Graham")          # Graham arrives
# >>> queue.popleft()                 # The first to arrive now leaves
# 'Eric'
# >>> queue.popleft()                 # The second to arrive now leaves
# 'John'
# >>> queue                           # Remaining queue in order of arrival
# deque(['Michael', 'Terry', 'Graham'])


# list comprehensions

# >>> squares = []
# >>> for x in range(10):
# ...     squares.append(x**2)
# ...
# >>> squares
# [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

# NOTE
# this creates (or overwrites) a variable named x that still exists
#   after the loop completes
# we can calculate the list of squares without any side effects using

squares = list(map(lambda x: x**2, range(10)))

# or

squares = [x**2 for x in range(10)]

# a list comprehension consists of brackets containing
#   an expression followed by a for clause, then zero or if clauses

# NOTE
# a tuple (like (x, y)) must be parenthesized

# >>> [(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
# [(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]

# it's equivalent to

# >>> combs = []
# >>> for x in [1,2,3]:
# ...     for y in [3,1,4]:
# ...         if x != y:
# ...             combs.append((x, y))
# ...
# >>> combs
# [(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]

# list comprehension can contain complex expression and nested functions

# >>> from math import pi
# >>> [str(round(pi, i)) for i in range(1, 6)]
# ['3.1', '3.14', '3.142', '3.1416', '3.14159']


# nested list comprehension

# >>> matrix = [
# ...     [1, 2, 3, 4],
# ...     [5, 6, 7, 8],
# ...     [9, 10, 11, 12],
# ... ]

# the following list comprehensions will transpose rows and columns

# list comprehension 1

# >>> [[row[i] for row in matrix] for i in range(4)]
# [[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]

# list comprehension 2

# >>> transposed = []
# >>> for i in range(4):
# ...     transposed.append([row[i] for row in matrix])
# ...
# >>> transposed
# [[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]

# list comprehension 3, the same as 2

# >>> transposed = []
# >>> for i in range(4):
# ...     # the following 3 lines implement the nested listcomp
# ...     transposed_row = []
# ...     for row in matrix:
# ...         transposed_row.append(row[i])
# ...     transposed.append(transposed_row)
# ...
# >>> transposed
# [[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]
# >>> list(zip(*matrix))
# [(1, 5, 9), (2, 6, 10), (3, 7, 11), (4, 8, 12)]

# list comprehension 4
# in the real world, the zip() function would do a great job for this use case

# >>> list(zip(*matrix))
# [(1, 5, 9), (2, 6, 10), (3, 7, 11), (4, 8, 12)]


# the del statement

# remove slices from a list

# >>> a = [-1, 1, 66.25, 333, 333, 1234.5]
# >>> del a[0]
# >>> a
# [1, 66.25, 333, 333, 1234.5]
# >>> del a[2:4]
# >>> a
# [1, 66.25, 1234.5]
# >>> del a[:]
# >>> a
# []

# delete entire variables

# >>> del a


# tuples and sequences

# tuples

# tuples are immutable
#   and usually contain a sequence of elements that
#     are accessed via unpacking or indexing
# lists are mutable
#   and their elements are usually accessed by iterating over the list

# >>> t = 12345, 54321, 'hello!'
# >>> t[0]
# 12345
# >>> t
# (12345, 54321, 'hello!')
# >>> # Tuples may be nested:
# ... u = t, (1, 2, 3, 4, 5)
# >>> u
# ((12345, 54321, 'hello!'), (1, 2, 3, 4, 5))
# >>> # Tuples are immutable:
# ... t[0] = 88888
# Traceback (most recent call last):
#   File "<stdin>", line 1, in <module>
# TypeError: 'tuple' object does not support item assignment
# >>> # but they can contain mutable objects:
# ... v = ([1, 2, 3], [3, 2, 1])
# >>> v
# ([1, 2, 3], [3, 2, 1])

# a tuples containing 0 or 1 items

# empty tuples are constructed by an empty pair of parentheses
# a tuple with one item is constructed by following a value with a comma

# >>> empty = ()
# >>> singleton = 'hello',    # <-- note trailing comma
# >>> len(empty)
# 0
# >>> len(singleton)
# 1
# >>> singleton
# ('hello',)

# tuple packing

# the value 12345, 54321, 'hello!' are packed together in a tuple

# >>> x, y, z = t


# sets

# besic use of sets

# the basic use of sets include
#   membership testing and eliminating duplicate entries

# curly braces or the set() function can be used to create sets

# >>> basket = {'apple', 'orange', 'apple', 'pear', 'orange', 'banana'}
# >>> # show that duplicates have been removed
# >>> print(basket)
# {'orange', 'banana', 'pear', 'apple'}
# >>> 'orange' in basket                 # fast membership testing
# True
# >>> 'crabgrass' in basket
# False

# >>> # Demonstrate set operations on unique letters from two words
# ...
# >>> a = set('abracadabra')
# >>> b = set('alacazam')
# >>> a                                  # unique letters in a
# {'a', 'r', 'b', 'c', 'd'}
# >>> a - b                              # letters in a but not in b
# {'r', 'd', 'b'}
# >>> a | b                              # letters in a or b or both
# {'a', 'c', 'r', 'd', 'b', 'm', 'z', 'l'}
# >>> a & b                              # letters in both a and b
# {'a', 'c'}
# >>> a ^ b                              # letters in a or b but not both
# {'r', 'd', 'b', 'm', 'z', 'l'}

# >>> a = {x for x in 'abracadabra' if x not in 'abc'}
# >>> a
# {'r', 'd'}


# dictionaries

# key-value pair

# >>> tel = {'jack': 4098, 'sape': 4139}
# >>> tel['guido'] = 4127
# >>> tel
# {'sape': 4139, 'guido': 4127, 'jack': 4098}
# >>> tel['jack']
# 4098
# >>> del tel['sape']
# >>> tel['irv'] = 4127
# >>> tel
# {'guido': 4127, 'irv': 4127, 'jack': 4098}
# >>> list(tel.keys())
# ['irv', 'guido', 'jack']
# >>> sorted(tel.keys())
# ['guido', 'irv', 'jack']
# >>> 'guido' in tel
# True
# >>> 'jack' not in tel
# False

# build dictionaries

# The dict() constructor builds dictionaries
#   directly from sequences of key-value pairs:

# >>> dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
# {'sape': 4139, 'jack': 4098, 'guido': 4127}

# In addition, dict comprehensions can be used to
#   create dictionaries from arbitrary key and value expressions:

# >>> {x: x**2 for x in (2, 4, 6)}
# {2: 4, 4: 16, 6: 36}


# looping techniques

# looping through dictionaries

# >>> knights = {'gallahad': 'the pure', 'robin': 'the brave'}
# >>> for k, v in knights.items():
# ...     print(k, v)
# ...
# gallahad the pure
# robin the brave

# looping through a sequence

# the position index and corresponding value
#   can be retrieved at the same time using enumerate()

# >>> for i, v in enumerate(['tic', 'tac', 'toe']):
# ...     print(i, v)
# ...
# 0 tic
# 1 tac
# 2 toe

# to loop over two or more sequences at the same time
# use zip() function

# >>> questions = ['name', 'quest', 'favorite color']
# >>> answers = ['lancelot', 'the holy grail', 'blue']
# >>> for q, a in zip(questions, answers):
# ...     print('What is your {0}?  It is {1}.'.format(q, a))
# ...
# What is your name?  It is lancelot.
# What is your quest?  It is the holy grail.
# What is your favorite color?  It is blue.

# loop over a sequence in reverse
# using reversed() function

# >>> for i in reversed(range(1, 10, 2)):
# ...     print(i)
# ...
# 9
# 7
# 5
# 3
# 1

# to loop a sequence in sorted order
# use the sorted()

# >>> basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
# >>> for f in sorted(set(basket)):
# ...     print(f)
# ...
# apple
# banana
# orange
# pear

# loop to create a new list

# >>> import math
# >>> raw_data = [56.2, float('NaN'), 51.7, 55.3, 52.5, float('NaN'), 47.8]
# >>> filtered_data = []
# >>> for value in raw_data:
# ...     if not math.isnan(value):
# ...         filtered_data.append(value)
# ...
# >>> filtered_data
# [56.2, 51.7, 55.3, 52.5, 47.8]


# condition

# comparisons can be chained

# a < b == c
# a < b or b == c    using boolean operators

# assign the result of comparision to a variable

# >>> string1, string2, string3 = '', 'Trondheim', 'Hammer Dance'
# >>> non_null = string1 or string2 or string3
# >>> non_null
# 'Trondheim'

# comparing sequences

# comparing objects of different types with < or > is legal

# (1, 2, 3)              < (1, 2, 4)
# [1, 2, 3]              < [1, 2, 4]
# 'ABC' < 'C' < 'Pascal' < 'Python'
# (1, 2, 3, 4)           < (1, 2, 4)
# (1, 2)                 < (1, 2, -1)
# (1, 2, 3)             == (1.0, 2.0, 3.0)
# (1, 2, ('aa', 'ab'))   < (1, 2, ('abc', 'a'), 4)
