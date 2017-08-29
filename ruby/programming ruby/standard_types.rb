## number

# Fixnum

num = 8
7.times do
  print num.type, " ", num, "\n"
  num *= num
end

produces:

Fixnum 8
Fixnum 64
Fixnum 4096
Fixnum 16777216
Bignum 281474976710656
Bignum 79228162514264337593543950336
Bignum 6277101735386680763835789423207666416102355444464034512896

# write integers using an optional leading sign

123456                    # Fixnum
123_456                   # Fixnum (underscore ignored)
-543                      # Negative Fixnum
123_456_789_123_345_789   # Bignum
0xaabb                    # Hexadecimal
0377                      # Octal
-0b101_010                # Binary (negated)

# get the corresponding ASCII character

?a                        # character code
?\n                       # code for a newline (0x0a)
?\C-a                     # control a = ?A & 0x9f = 0x01
?\M-a                     # meta sets bit 7
?\M-\C-a                  # meta and control a
?\C-?                     # delete character

# several useful iterators

3.times        { print "X " }
1.upto(5)      { |i| print i, " " }
99.downto(95)  { |i| print i, " " }
50.step(80, 5) { |i| print i, " " }

produces:

X X X 1 2 3 4 5 99 98 97 96 95 50 55 60 65 70 75 80

# strings contain numbers are not automatically converted into numbers

Feed it a file containing

3 4
5 6
7 8

DATA.each do |line|
  vals = line.split              # split line, storing tokens in val
  print vals[0] + vals[1], " "
end

produces:
34 56 78

DATA.each do |line|
  vals = line.split
  print vals[0].to_i + vals[1].to_i, " "
end

produces:
7 11 15


## strings

# single-quoted string delimiters

'escape using "\\"'         #  »  escape using "\"
'That\'s right'             #  »  That's right

# double-quoted string delimiters

"Seconds/day: #{24*60*60}"     » Seconds/day: 86400
"#{'Ho! '*3}Merry Christmas"   » Ho! Ho! Ho! Merry Christmas
"This is line #$."             » This is line 3

# %q and %Q

%q/general single-quoted string/	»	general single-quoted string
%Q!general double-quoted string!	»	general double-quoted string
%Q{Seconds/day: #{24*60*60}}            »	Seconds/day: 86400

# a here document

aString = <<END_OF_STRING
    The body of the string
    is the input lines up to
    one ending with the same
    text that followed the '<<'
END_OF_STRING

print <<-STRING1, <<-STRING2
   Concat
   STRING1
      enate
      STRING2

produces:
     Concat
        enate

# the list of songs

/jazz/j00319.mp3  | 2:58 | Louis    Armstrong  | Wonderful World
/bgrass/bg0732.mp3| 4:09 | Strength in Numbers | Texas Red
         :                  :           :                   :

# String#split & String#chomp

songs = SongList.new

songFile.each do |line|
  file, length, name, title = line.chomp.split(/\s*\|\s*/)
  songs.append Song.new(title, name, length)
end
puts songs[1]

produces:
Song: Wonderful World--Louis    Armstrong (2:58)

# String#squeeze

songs = SongList.new

songFile.each do |line|
  file, length, name, title = line.chomp.split(/\s*\|\s*/)
  name.squeeze!(" ")
  songs.append Song.new(title, name, length)
end
puts songs[1]

produces:

Song: Wonderful World--Louis Armstrong (2:58)

# String#scan

songs = SongList.new
songFile.each do |line|
  file, length, name, title = line.chomp.split(/\s*\|\s*/)
  name.squeeze!(" ")
  mins, secs = length.scan(/\d+/)
  songs.append Song.new(title, name, mins.to_i*60+secs.to_i)
end
puts songs[1]

produces:

Song: Wonderful World--Louis Armstrong (178)

# search capability

class WordIndex
  def initialize
    @index = Hash.new(nil)
  end
  def index(anObject, *phrases)
    phrases.each do |aPhrase|
      aPhrase.scan /\w[-\w']+/ do |aWord|   # extract each word
        aWord.downcase!
        @index[aWord] = [] if @index[aWord].nil?
        @index[aWord].push(anObject)
      end
    end
  end
  def lookup(aWord)
    @index[aWord.downcase]
  end
end

class SongList
  def initialize
    @songs = Array.new
    @index = WordIndex.new
  end
  def append(aSong)
    @songs.push(aSong)
    @index.index(aSong, aSong.name, aSong.artist)
    self
  end
  def lookup(aWord)
    @index.lookup(aWord)
  end
end

songFile.each do |line|
  file, length, name, title = line.chomp.split(/\s*\|\s*/)
  name.squeeze!(" ")
  mins, secs = length.scan(/\d+/)
  songs.append Song.new(title, name, mins.to_i*60+secs.to_i)
end
puts songs.lookup("Fats")
puts songs.lookup("ain't")
puts songs.lookup("RED")
puts songs.lookup("WoRlD")

produces:

Song: Ain't Misbehavin'--Fats Waller (225)
Song: Ain't Misbehavin'--Fats Waller (225)
Song: Texas Red--Strength in Numbers (249)
Song: Wonderful World--Louis Armstrong (178)

## ranges

## ranges as sepuences

# sequences have a start point, an end point
#   and a way to produce successive values in the sequence
# these sequences are creates using the .. and ...
#   the two-dot form creates an inclusive range
#   while the three-dot form creates a range that excludes the specified high value
1..10
'a'..'z'
0...anArray.length

# ranges are not represented internally as lists
# the sequence 1..1000 is held as a range object
#   containing references to two Fixum objects

# you can convert a range to a list using the to_a method
(1..10).to_a           » [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
('bar'..'bat').to_a    » ["bar", "bas", "bat"]

# ranges implement methods that let you iterate over them
#   and test their contents in a variety of ways
digits = 0..9
digits.include?(5)                    »  true
digits.min                            »  0
digits.max                            »  9
digits.reject {|i| i < 5 }            »  [5, 6, 7, 8, 9]
digits.each do |digit|
  dial(digit)
end

## create a range-based object

# the only constraints are that the objects must raspond to succ
#   by returning the next object in suquence
#   and the objects must be comparable using <=>, the general comparison operator
#   <=> compares two values, returning -1, 0, -1
#     depending on whether the first is less than, equal to, or greater than the second
class VU
  include Comparable
  attr :volume
  def initialize(volume)  # 0..9
    @volume = volume
  end
  def inspect
    '#' * @volume
  end
  # Support for ranges
  def <=>(other)
    self.volume <=> other.volume
  end
  def succ
    raise(IndexError, "Volume too big") if @volume >= 9
    VU.new(@volume.succ)
  end
end

medium = VU.new(4)..VU.new(7)
medium.to_a                 » [####, #####, ######, #######]
medium.include?(VU.new(3))  » false

## ranges as conditions

# the following code fragment prints sets of lines from standard input
#   where the first line in each set contains the word "start"
#     and the last line the word "end"
while gets
  print if /start/../end/
end

## ranges as intervals

# seeing if some value fails within the interval represented by the range
# this is done using ===
(1..10)    === 5                                »  true
(1..10)    === 15                               »  false
(1..10)    === 3.14159                          »  true
('a'..'j') === 'c'                              »  true
('a'..'j') === 'z'                              »  false


## regular expressions

# regular expressions are objects of type Regexp
# they can be create by calling the constructor explicitly
#   or by using the literal forms /pattern/ and %r\pattern\
a = Regexp.new('^\s*[a-z]')                »  /^\s*[a-z]/
b = /^\s*[a-z]/                            »  /^\s*[a-z]/
c = %r{^\s*[a-z]}                          »  /^\s*[a-z]/

# once you have a regular expression object
# you can match it against a string using Regexp#match(astring)
#   or the match operator =~ (possitive match) and !~ (negative mathc)
a = "Fats Waller"
a =~ /a/                                    »    1
a =~ /z/                                    »    nil
a =~ "ll"                                   »    7

# $& receives the part of the string that was matched by the pattern
# $` reveives the part of the string that preceded the match
# $' receives the string after the match
def showRE(a,re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end
showRE('very interesting', /t/)      # » very in<<t>>eresting
showRE('Fats Waller', /ll/)          # » Fats Wa<<ll>>er

## patterns

# within a pattern
# all characters except . | ( ) [ { + \ ^ $ * ? match themselves
showRE('kangaroo', /angar/)              # »  k<<angar>>oo
showRE('!@%&-_=+', /%&/)                 # »  !@<<%&>>-_=+

# if you want to match one of these special characters literally
#   precede it with a backslash
showRE('yes | no', /\|/)               » yes <<|>> no
showRE('yes (no)', /\(no\)/)           » yes <<(no)>>
showRE('are you sure?', /e\?/)         » are you sur<<e?>>

## anchors

# the patterns ^ and $ match the beginning and end of a line
#   /^option/ matches the word "option" only if it appears at the start of a line
# the \A matches the beginning of the string
# the \z matches the end of the string
showRE("this is\nthe time", /^the/)    # » this is\n<<the>> time
showRE("this is\nthe time", /is$/)     # » this <<is>>\nthe time
showRE("this is\nthe time", /\Athis/)  # » <<this>> is\nthe time
showRE("this is\nthe time", /\Athe/)   # » no match

# the pattern \b and \B match word boundaries and nonword boundaries
showRE("this is\nthe time", /\bis/)   # » this <<is>>\nthe time
showRE("this is\nthe time", /\Bis/)   # » th<<is>> is\nthe time

## character classses

# [aeiou] will match a vowel
# [,.:;!?] matches punctuation
#   .|()[{+^$*?- is turned off inside the brackets
#   however, escape string still occurs
#   \s matches any whitespace character, not just a literal
showRE('It costs $12.', /[aeiou]/)      # » It c<<o>>sts $12.
showRE('It costs $12.', /[\s]/)         # » It<< >>costs $12.

# within the brackets
#   the sequence c[1]-c[2] represents all the characters between C[1] and c[2]
# the literal character ] and - within a character class
#   they must appear at the start
a = 'Gamma [Design Patterns-page 123]'
showRE(a, /[]]/)     # » Gamma [Design Patterns-page 123<<]>>
showRE(a, /[B-F]/)   # » Gamma [<<D>>esign Patterns-page 123]
showRE(a, /[-]/)     # » Gamma [Design Patterns<<->>page 123]
showRE(a, /[0-9]/)   # » Gamma [Design Patterns-page <<1>>23]
# TIP
# put a ^ immediately after the opening bracket
#   to negate a character classs [^a-z]
#   match any character that isn't a lowercase alphabetic

# some character classes are used so frequently
#   that ruby provides abbreviations for them
showRE('It costs $12.', /\s/)         # » It<< >>costs $12.
showRE('It costs $12.', /\d/)         # » It costs $<<1>>2.
# TIP
# some useful character class abbreviations
# \d  [0-9]          Digit character
# \D  [^0-9]         Nondigit
# \s  [\s\t\r\n\f]   Whitespace character
# \S  [^\s\t\r\n\f]  Nonwhitespace character
# \w  [A-Za-z0-9_]   Word character
# \W  [^A-Za-z0-9_]  Nonword character

# a period (.) appearing brackets represents any character except a newline
#   and multiline mode it matches a newline
a = 'It costs $12.'
showRE(a, /c.s/)             # »  It <<cos>>ts $12.
showRE(a, /./)               # »  <<I>>t costs $12.
showRE(a, /\./)              # »  It costs $12<<.>>

## repetition

# If r stands for the immediately preceding regular expression within a pattern, then:
# r *     matches zero or more occurrences of r.
# r +     matches one or more occurrences of r.
# r ?     matches zero or one occurrence of r.
# r {m,n} matches at least ``m'' and at most ``n'' occurrences of r.
# r {m,}  matches at least ``m'' occurrences of r.

a = "The moon is made of cheese"
showRE(a, /\w+/)            # » <<The>> moon is made of cheese
showRE(a, /\s.*\s/)         # » The<< moon is made of >>cheese
showRE(a, /\s.*?\s/)        # » The<< moon >>is made of cheese
showRE(a, /[aeiou]{2,99}/)  # » The m<<oo>>n is made of cheese
showRE(a, /mo?o/)           # » The <<moo>>n is made of cheese

## alternation

a = "red ball blue sky"
showRE(a, /d|e/)                    # » r<<e>>d ball blue sky
showRE(a, /al|lu/)                  # » red b<<al>>l blue sky
showRE(a, /red ball|angry sky/)     # » <<red ball>> blue sky

# there's a trap here
# "|" has a very low precedence
# the last example above match "red ball" or "angry sky"
#   not "red ball sky" or "red angry sky"
# to match "red ball sky" or "red angry sky"
#   you'd need to override the default precedence using grouping

## grouping

showRE('banana', /an*/)                    # »  b<<an>>ana
showRE('banana', /(an)*/)                  # »  <<>>banana
showRE('banana', /(an)+/)                  # »  b<<anan>>a
a = 'red ball blue sky'
showRE(a, /blue|red/)             # » <<red>> ball blue sky
showRE(a, /(blue|red) \w+/)       # » <<red ball>> blue sky
showRE(a, /(red|blue) \w+/)       # » <<red ball>> blue sky
showRE(a, /red|blue \w+/)         # » <<red>> ball blue sky
showRE(a, /red (ball|angry) sky/)    # » no match
a = 'the red angry sky'
showRE(a, /red (ball|angry) sky/)    # » the <<red angry sky>>

# within the pattern
# the sequence \1 refers to the match of the first group
#   \2 the second group, and so on
# outside the pattern, the special variables $1, $2, and so on

"12:50am" =~ /(\d\d):(\d\d)(..)/    # » 0
"Hour is #$1, minute #$2"           # » "Hour is 12, minute 50"
"12:50am" =~ /((\d\d):(\d\d))(..)/  # » 0
"Time is #$1"                       # » "Time is 12:50"
"Hour is #$2, minute #$3"           # » "Hour is 12, minute 50"
"AM/PM is #$4"                      # » "AM/PM is am"

# using part of current match to look for various forms of repetition

# match duplicated letter
showRE('He said "Hello"', /(\w)\1/)    # » He said "He<<ll>>o"
# match duplicated substrings
showRE('Mississippi', /(\w+)\1/)       # » M<<ississ>>ippi

# You can also use back references to match delimiters.

showRE('He said "Hello"', /(["']).*?\1/) # » He said <<"Hello">>
showRE("He said 'Hello'", /(["']).*?\1/) # » He said <<'Hello'>>

## substitution

# the method String#sub and String#gsub
#   look for a portion of a string matching their first argument
#   and replace it with their second argument

a = "the quick brown fox"
a.sub(/[aeiou]/,  '*')         # » "th* quick brown fox"
a.gsub(/[aeiou]/, '*')         # » "th* q**ck br*wn f*x"
a.sub(/\s\S+/,  '')            # » "the brown fox"
a.gsub(/\s\S+/, '')            # » "the"

# the second argument to both functions can be either a String or a block

a = "the quick brown fox"
a.sub(/^./) { $&.upcase }           # » "The quick brown fox"
a.gsub(/[aeiou]/) { $&.upcase }     # » "thE qUIck brOwn fOx"

def mixedCase(aName)
  aName.gsub(/\b\w/) { $&.upcase }
end
mixedCase("fats waller")             # » "Fats Waller"
mixedCase("louis armstrong")         # » "Louis Armstrong"
mixedCase("strength in numbers")     # » "Strength In Numbers"

## backslash sequences in the substitution

"fred:smith".sub(/(\w+):(\w+)/, '\2, \1')     # » "smith, fred"
"nercpyitno".gsub(/(.)(.)/, '\2\1')           # » "encryption"

# how to display "\" literal backslash in ruby
#   first '\\'
#     you should convert one \ (mean have no characters after it) to literal backslash
#   second '\\\\'
#     to represent this as a string literal
#       you have to escape those backslash again

str = 'a\b\c'                               # »  "a\b\c"
str.gsub(/\\/, '\\\\\\\\')                  # »  "a\\b\\c"
str.gsub(/\\/, '\&\&')                      # »  "a\\b\\c"

# if you use the blcok form of gsub
# the string for substitution is analyzed only once

str.gsub(/\\/) { '\\\\' }                   # »  "a\\b\\c"

# the code takes a string containing HTML escape sequences
#   and converts it into normal ASCII

def unescapeHTML(string)
  str = string.dup
  str.gsub!(/&(.*?);/n) {
    match = $1.dup
    case match
    when /\Aamp\z/ni           then '&'
    when /\Aquot\z/ni          then '"'
    when /\Agt\z/ni            then '>'
    when /\Alt\z/ni            then '<'
    when /\A#(\d+)\z/n         then Integer($1).chr
    when /\A#x([0-9a-f]+)\z/ni then $1.hex.chr
    end
  }
  str
end

puts unescapeHTML("1&lt;2 &amp;&amp; 4&gt;3")
puts unescapeHTML("&quot;A&quot; = &#65; = &#x41;")

# produces:
#   1<2 && 4>3
#   "A" = A = A

## object-oriented regular expressions

# instance of class Regexp

re = /cat/
re.type                        »    Regexp

# the method Regexp#match matches a regular expression against a string
#   the MatchData object gives you access to all available information about the match
#   you can get from the $-variables is bundled in a handy little object

re = /(\d+):(\d+)/     # match a time hh:mm
md = re.match("Time: 12:34am")
md.type                                  # »  MatchData
md[0]         # == $&                      »  "12:34"
md[1]         # == $1                      »  "12"
md[2]         # == $2                      »  "34"
md.pre_match  # == $`                      »  "Time: "
md.post_match # == $'                      »  "am"

# in the next example we're matching the same Regexp object against two strings
#   each match returns a unique MatchData
#   you can't do using the $-variables

re = /(\d+):(\d+)/     # match a time hh:mm
md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30pm")
md1[1, 2]                # »   ["12", "34"]
md2[1, 2]                # »   ["10", "30"]

# after every pattern match
#   ruby stores a reference to the result (nil or a MatchData object)
#     in a thread-local variable (accessible using $~)

re = /(\d+):(\d+)/
md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30pm")
[ $1, $2 ]   # last successful match          » ["10", "30"]
$~ = md1
[ $1, $2 ]   # previous successful match      » ["12", "34"]
