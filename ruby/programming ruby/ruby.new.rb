## genuine object-oriented method

# these objects are created by calling a _constructor_
#   a special method associated with a class. The standard constructor is called new
song1 = Song.new("Ruby Tuesday")
song2 = Song.new("Enveloped in Python")

# Here, the thing before the period is called the _receiver_
#   and the name after the period is the method to be invoked
"gin joint".length      # » 9
"Rick".index("c")       # » 2
-1942.abs               # » 1942
sam.play(aSong)         # » "duh dum, da dum de dum ..."

# number = Math.abs(number)     Java code
# number = number.abs           ruby code
# strlen(name)                  C code


## function syntax

# a simple ruby function
def sayGoodnight(name)
  result = "Goodnight, " + name  # You don't need semicolons at the ends of statements
                                 # as long as you put each statement on a separate line
  return result
end


## precedence rules

puts sayGoodnight("John-Boy")
puts sayGoodnight("Mary-Ellen")
# precedence rules can make it difficult to know
#   which argument goes with which method invocation
#   so we recommend using parentheses in all but the simplest cases
puts sayGoodnight "John-Boy"
puts sayGoodnight("John-Boy")
puts(sayGoodnight "John-Boy")
puts(sayGoodnight("John-Boy"))


## slash escape

puts "And Goodnight,\nGrandma"


## expression interpolation

def sayGoodnight(name)
  result = "Goodnight, #{name}"  # #{ expression } is replaced by the value of expression
  return result
end

# the last expression evaluated
def sayGoodnight(name)
  "Goodnight, #{name}"  # The value returned by a Ruby method is the value of the last expression evaluated
end                     # so we can get rid of the return statement altogether


## identifier

# local variables           start with lowerccase letter or with an underscore
# method parameters
# method names
# global variables          prefixed wirh $
# instance variables        begin with @
# class variables           start with @@
# class names               start with an uppercase letter
# module names
# constants


## array and hash

a = [ 1, 'cat', 3.14 ]   # array with three elements

# access the first element
a[0]         #    »   1
# set the third element
a[2] = nil
# dump out the array
a            #    »   [1, "cat", nil]

# create empty arrays
empty1 = []
empty2 = Array.new

# shortcut
a = %w{ ant bee cat dog elk }
a[0]         #    »     "ant"
a[3]         #    »     "dog"

# hash table
instSection = {
  'cello'     => 'string',
  'clarinet'  => 'woodwind',
  'drum'      => 'percussion',
  'oboe'      => 'woodwind',
  'trumpet'   => 'brass',
  'violin'    => 'string'
}
instSection['oboe']                   #   »  "woodwind"
instSection['cello']                  #   »  "string"
instSection['bassoon']                #   »  nil


## control structures

# if
if radiation > 3000
  puts "Danger, Will Robinson"
end
# if...else
if count > 10
  puts "Try again"
elsif tries == 3
  puts "You lose"
else
  puts "Enter a number"
end
# while
while weight < 100 and numPallets <= 30
  pallet = nextPallet()
  weight += pallet.weight
  numPallets += 1
end
while square < 1000
   square = square*square
end


## regular expressions

# /Perl|Python/
# /P(erl|ython)/
# /\d\d:\d\d:\d\d/      a time such as 12:34:56
# /Perl.*Python/        Perl, zero or more other chars, then Python
# /Perl\s+Python/       Perl, one or more spaces, then Python
# /Ruby (Perl|Python)/  Ruby, a space, and either Perl or Python

# match pattern =~
if line =~ /Perl|Python/
  puts "Scripting language mentioned: #{line}"
end
line.sub(/Perl/, 'Ruby')    # replace first 'Perl' with 'Ruby'
line.gsub(/Python/, 'Ruby') # replace every 'Python' with 'Ruby'


## block and iterators

{ puts "Hello" }       # this is a block

do                     #
  club.enroll(person)  # and so is this
  person.socialize     #
end                    #

def callBlock
  yield
  yield
end
callBlock { puts "In the block" }
# produces:
# In the block
# In the block

a = %w( ant bee cat dog elk )    # create an array
a.each { |animal| puts animal }  # iterate over the contents
# produces:
# ant
# bee
# cat
# dog
# elk

# within class Array...
def each
  for each element
    yield(element)
  end
end
[ 'cat', 'dog', 'horse' ].each do |animal|
  print animal, " -- "
end
# produces:
# cat -- dog -- horse --

5.times {  print "*" }
3.upto(6) {|i|  print i }
('a'..'e').each {|char| print char }
# produces:
# *****3456abcde


## Reading and 'Riting

# print its arguments
printf "Number: %5.2f, String: %s", 1.23, "hello"
# produces:
# Number:  1.23, String: hello

# read input into your program
line = gets
print line

while gets           # assigns line to $_
  if /Ruby/          # matches against $_
    print            # prints $_
  end
end

# This uses the predefined object _ARGF_
# which represents the input stream that can be read by a program
ARGF.each { |line|  print line  if line =~ /Ruby/ }
