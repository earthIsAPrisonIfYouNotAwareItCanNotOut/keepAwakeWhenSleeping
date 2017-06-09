## initialize class

class Song
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
  end
end


## instance

aSong = Song.new("Bicylops", "Fleck", 260)


## toString

class Song
  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.to_s      » "Song: Bicylops--Fleck (260)"


## inheritance

class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end
end

# the Song class to_s method
aSong = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
aSong.to_s      » "Song: My Way--Sinatra (225)"


## rewrite

# method 1
class KaraokeSong
  # ...
  def to_s
    "KS: #{@name}--#{@artist} (#{@duration}) [#{@lyrics}]"
  end
end

# method 2
class KaraokeSong < Song
  # Format ourselves as a string by appending
  # our lyrics to our parent's #to_s value.
  def to_s
    super + " [#{@lyrics}]"
  end
end

# the KaraokeSong to_s method
aSong = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
aSong.to_s » "Song: My Way--Sinatra (225) [And now, the...]"


## objects and attrubutes

# simple method
#   these externally visible facets of an object are called its attributes
class Song
  def name
    @name
  end
  def artist
    @artist
  end
  def duration
    @duration
  end
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.artist                        » "Fleck"
aSong.name                          » "Bicylops"
aSong.duration                      » 260

# convenient method
#   attr_reader create these accessor methods for you
class Song
  attr_reader :name, :artist, :duration
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.artist                        » "Fleck"
aSong.name                          » "Bicylops"
aSong.duration                      » 260


## writable attributes

# class JavaSong {                     // Java code
#   private Duration myDuration;
#   public void setDuration(Duration newDuration) {
#     myDuration = newDuration;
#   }
# }
# s = new Song(....)
# s.setDuration(length)

class Song
  attr_writer :duration
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.duration = 257


## virtual attributes

# use attribute method to create a virtual instance variable
# though there is no corresponding instance variable
class Song
  def durationInMinutes
    @duration/60.0   # force floating point
  end
  def durationInMinutes=(value)
    @duration = (value*60).to_i
  end
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.durationInMinutes                  »  4.333333333
aSong.durationInMinutes = 4.2
aSong.duration                           »  252
# TIP
# by hiding the difference between instance variables and caculated values
# you are shielding the rest of the world from the implementation of your class


## class variable

class Song
  @@plays = 0  # class varaible must be initialized befor they are used
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end
  def play
    @plays += 1
    @@plays += 1
    "This  song: #@plays plays. Total #@@plays plays."  # accessible to the method
  end
end

# for debugging purposes
# arranged for Song#play to return the number of times this song has been play
#   along with the total number of plays for all songs
s1 = Song.new("Song1", "Artist1", 234)  # test songs..
s2 = Song.new("Song2", "Artist2", 345)
s1.play   » "This  song: 1 plays. Total 1 plays."
s2.play   » "This  song: 1 plays. Total 2 plays."
s1.play   » "This  song: 2 plays. Total 3 plays."
s1.play   » "This  song: 3 plays. Total 4 plays."

# NOTE
# class variables are private
# you may write an accessor method to let it avvessible to the outside world


## class method

# you can use .delete mathod directly by File class
# File.delete("doomedFile")

class Example
  def instMeth              # instance method
  end
  def Example.classMeth     # class method
  end
end

class SongList
  MaxTime = 5*60           #  5 minutes
  def SongList.isTooLong(aSong)
    return aSong.duration > MaxTime
  end
end
song1 = Song.new("Bicylops", "Fleck", 260)
SongList.isTooLong(song1)                         # false
song2 = Song.new("The Calling", "Santana", 468)
SongList.isTooLong(song2)                         # true


## Singletons

# by making logger's method new private
# we prevent anyone from creating a logging object using the constructor
class Logger
  private_class_method :new
  @@logger = nil
  def Logger.create
    @@logger = new unless @@logger
    @@logger
  end
end
Logger.create.id                      »  537766930
Logger.create.id                      »  537766930


## Other Constructors

class Shape
  def initialize(numSides, perimeter)
    # ...
  end
end

class Shape
  def Shape.triangle(sideLength)
    Shape.new(3, sideLength*3)
  end
  def Shape.square(sideLength)
    Shape.new(4, sideLength*4)
  end
end


## access control

# public
# protected       called by internal state of other objects of the same class
# private         called by context object
#                 not called another's directly if the object is the same class


## specifying access control

# how to specify access control method 1
class MyClass
      def method1    # default is 'public'
        #...
      end
  protected          # subsequent methods will be 'protected'
      def method2    # will be 'protected'
        #...
      end
  private            # subsequent methods will be 'private'
      def method3    # will be 'private'
        #...
      end
  public             # subsequent methods will be 'public'
      def method4    # and this will be 'public'
        #...
      end
end

# how to specify access control method 2
# set access levels of names methods by listing them as arguments
class MyClass

  def method1
  end

  # ... and so on

  public    :method1, :method4
  protected :method2
  private   :method3
end

# accounting system
# every debit has a corresponding credit
#   set it private to encsure no one can break this rule
class Accounts

  private

    def debit(account, amount)
      account.balance -= amount
    end
    def credit(account, amount)
      account.balance += amount
    end

  public

    #...
    def transferToSavings(amount)
      debit(@checking, amount)
      credit(@savings, amount)
    end
    #...
end

# because balance is protexted
#   it's available only within account objects
class Account
  attr_reader :balance       # accessor method 'balance'

  protected :balance         # and make it protected

  def greaterBalanceThan(other)
    return @balance > other.balance
  end
end


## variables

# a variable is simply a reference to an object
# object in a heap somewhere and are pointed to by variables
person = "Tim"
person.id                       »   537771100
person.type                     »   String
person                          »   "Tim"

# both personl1 and personl2 refer to the same object
person1 = "Tim"
person2 = person1
person1[0] = 'J'
person1                            »    "Jim"
person2                            »    "Jim"

# use dup method of string to create a new String object with identical contents
person1 = "Tim"
person2 = person1.dup
person1[0] = "J"
person1                           »   "Jim"
person2                           »   "Tim"

# prevent anyone from changing a particular object by freezing it
person1 = "Tim"
person2 = person1
person1.freeze       # prevent modifications to the object
person2[0] = "J"
# ruby will raise a typeerror exception if you attempt to alter a frozen objects
# produces:
# prog.rb:4:in `=': can't modify frozen string (TypeError)
#         from prog.rb:4
