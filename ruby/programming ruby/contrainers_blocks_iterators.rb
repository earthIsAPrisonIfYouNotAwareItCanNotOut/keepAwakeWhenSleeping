## Arrays

# object reference
a = [ 3.14159, "pie", 99 ]
a.type            »  Array
a.length          »  3
a[0]              »  3.14159
a[1]              »  "pie"
a[2]              »  99
a[3]              »  nil
b = Array.new
b.type            »  Array
b.length          »  0
b[0] = "second"
b[1] = "array"
b                 »  ["second", "array"]

# index with a negative integer
a = [ 1, 3, 5, 7, 9 ]
a[-1]                                 »       9
a[-2]                                 »       7
a[-99]                                »       nil

# index with a pair of numbers
a = [ 1, 3, 5, 7, 9 ]
a[1, 3]                     »   [3, 5, 7]
a[3, 1]                     »   [7]
a[-3, 2]                    »   [5, 7]

# index using range
a = [ 1, 3, 5, 7, 9 ]
a[1..3]                       »   [3, 5, 7]
a[1...3]                      »   [3, 5]
a[3..3]                       »   [7]
a[-3..-1]                     »   [5, 7, 9]

# set elements in array
a = [ 1, 3, 5, 7, 9 ] » [1, 3, 5, 7, 9]
a[1] = 'bat'          » [1, "bat", 5, 7, 9]
a[-3] = 'cat'         » [1, "bat", "cat", 7, 9]
a[3] = [ 9, 8 ]       » [1, "bat", "cat", [9, 8], 9]
a[6] = 99             » [1, "bat", "cat", [9, 8], 9, nil, 99]

# replace by two numbers (a start and a range)
a = [ 1, 3, 5, 7, 9 ] » [1, 3, 5, 7, 9]
a[2, 2] = 'cat'       » [1, 3, "cat", 9]
a[2, 0] = 'dog'       » [1, 3, "dog", "cat", 9]
a[1, 1] = [ 9, 8, 7 ] » [1, 9, 8, 7, "dog", "cat", 9]
a[0..3] = []          » ["dog", "cat", 9]
a[5] = 99             » ["dog", "cat", 9, nil, nil, 99]


## Hashes

# index of any type
h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' =>
 'asinine' }
h.length » 3
h['dog'] » "canine"
h['cow'] = 'bovine'
h[12]    = 'dodecine'
h['cat'] = 99
h        » {"cow"=>"bovine", "cat"=>99, 12=>
           "dodecine", "donkey"=>"asinine", "dog"=>"canine"}


## SongList Container

# the container template
append( aSong ) » list
    Append the given song to the list.
deleteFirst() » aSong
    Remove the first song from the list, returning that song.
deleteLast() » aSong
    Remove the last song from the list, returning that song.
[ anIndex ] » aSong
    Return the song identified by anIndex, which may be an integer index or a song title.

# a basic initialize method
class SongList
  def initialize
    @songs = Array.new
  end
end

# add the given song to the end of @songs arrays
class SongList
  def append(aSong)
    @songs.push(aSong)
    self
  end
end

# the delete method
class SongList
  def deleteFirst
    @songs.shift
  end
  def deleteLast
    @songs.pop
  end
end

# append four songs to the list
list = SongList.new
list.
  append(Song.new('title1', 'artist1', 1)).
  append(Song.new('title2', 'artist2', 2)).
  append(Song.new('title3', 'artist3', 3)).
  append(Song.new('title4', 'artist4', 4))
# test delete method
list.deleteFirst        » Song: title1--artist1 (1)
list.deleteFirst        » Song: title2--artist2 (2)
list.deleteLast         » Song: title4--artist4 (4)
list.deleteLast         » Song: title3--artist3 (3)
list.deleteLast         » nil

# define [] method
class SongList
  def [](key)
    if key.kind_of?(Integer)
      @songs[key]
    else
      # ...
    end
  end
end
# test
list[0]       »  Song: title1--artist1 (1)
list[2]       »  Song: title3--artist3 (3)
list[9]       »  nil
## blocks and iterators
class SongList
  def [](key)
    if key.kind_of?(Integer)
      return @songs[key]
    else
      for i in 0...@songs.length
        return @songs[i] if key == @songs[i].name
      end
    end
    return nil
  end
end
# more natural way
class SongList
  def [](key)
    if key.kind_of?(Integer)
      result = @songs[key]
    else
      result = @songs.find { |aSong| key == aSong.name }
    end
    return result
  end
end
# use if as a statement to shorten the code
class SongList
  def [](key)
    return @songs[key] if key.kind_of?(Integer)
    return @songs.find { |aSong| aSong.name == key }
  end
end


## implement iterators

# _yield_ default invokes the code in the block
def threeTimes
  yield
  yield
  yield
end
threeTimes { puts "Hello" }

# the Fibonacci series
# passing the argument to yield
def fibUpTo(max)
  i1, i2 = 1, 1        # parallel assignment
  while i1 <= max
    yield i1
    i1, i2 = i2, i1+i2
  end
end
fibUpTo(1000) { |f| print f, " " }
produces:
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987

# a block return a value to the iterator of _find_ method
class Array
  def find
    for i in 0...size
      value = self[i]
      return value if yield(value)
    end
    return nil
  end
end
[1, 3, 5, 7, 9].find {|v| v*v > 30 }                      »  7

# iterator of each method
[ 1, 3, 5 ].each { |i| puts i }
produces:
1
3
5

# iterator of collect method
["H", "A", "L"].collect { |x| x.succ }     » ["I", "B", "M"]


## Ruby compare with C++ and Java

# an iterator can return derived values
f = File.open("testfile")
f.each do |line|
  print line
end
f.close
produces:
This is line one
This is line two
This is line three
And so on...

# inject a method
class Array
  def inject(n)
     each { |value| n = yield(n, value) }
     n
  end
  def sum
    inject(0) { |n, value| n + value }
  end
  def product
    inject(1) { |n, value| n * value }
  end
end
[ 1, 2, 3, 4, 5 ].sum                                »  15
[ 1, 2, 3, 4, 5 ].product                            »  120


## blocks for transactions

# FIle.open has two different behaviors:
#   1) when called with a block, the block returns, the file is closed
#   2) when called without a block, it returns the file object

# 2) passing the file object, close the file manually
class File
  def File.openAndProcess(*args)
    f = File.open(*args)
    yield f
    f.close()
  end
end
# use do...end to define a block
File.openAndProcess("testfile", "r") do |aFile|
  print while aFile.gets
end
produces:
This is line one
This is line two
This is line three
And so on...

# use _Kernel::block_given?_ to make sure if a block associated with the current method
class File
  def File.myOpen(*args)
    aFile = File.new(*args)
    # If there's a block, pass in the file and close
    # the file when it returns
    if block_given?
      yield aFile
      aFile.close
      aFile = nil
    end
    return aFile
  end
end


## blocks can be closures

# need to implement two button
bStart = Button.new("Start")
bPause = Button.new("Pause")
# ...

# bad
# if the interface to Button changes, you will make more subclass of Button
class StartButton < Button
  def initialize
    super("Start")       # invoke Button's initialize
  end
  def buttonPressed
    # do start actions...
  end
end
bStart = StartButton.new

# good
# passing a block of code to & argument, invoke the block by call method
#   the last parameter in a method is prefixed with _&_
#       ruby looks for a code block assign to it
#   the code block is converted to an class object of _Proc_
#       use the _Proc#call_ method on object to invoke the block
class JukeboxButton < Button
  def initialize(label, &action)
    super(label)
    @action = action
  end
  def buttonPressed
    @action.call(self)
  end
end
bStart = JukeboxButton.new("Start") { songList.start }
bPause = JukeboxButton.new("Pause") { songList.pause }

# a example of closure
#   use the method _proc_
#     which converts a block to a Proc object
def nTimes(aThing)
  return proc { |n| aThing * n }
end
p1 = nTimes(23)
p1.call(3)          »  69
p1.call(4)          »  92
p2 = nTimes("Hello ")
p2.call(3)          »  "Hello Hello Hello "
