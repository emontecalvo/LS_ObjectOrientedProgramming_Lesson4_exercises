# Easy 3
#  - - - - - - - - - - - - - Question 1


# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi
# answer => Hello

# case 2:

hello = Hello.new
hello.bye
# answer => NoMethodError: undefined method `bye' for #<Hello:0x007fab639338f0>
# case 3:

hello = Hello.new
hello.greet
# answer => ArgumentError: wrong number of arguments (0 for 1)

# case 4:

hello = Hello.new
hello.greet("Goodbye")
#answer => Goodbye      nil


# case 5:

Hello.hi

# answer: NoMethodError: undefined method `hi' for Hello:Class


# - - - - - - - - - - - - - - Question 2

# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
# If we call Hello.hi we get an error message. How would you fix this?

# answer, assign a variable to a new instance of the Hello class first
h1 = Hello.new
h1.hi
# launch school answer:
 # You could define the hi method on the Hello class as follows:

class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

# - - - - - - - - - - - - - - - - Question 3

# When objects are created they are a separate realization of a 
# particular class.

# Given the class below, how do we create two different 
# instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name 
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# answer:
bad_cat1 = AngryCat.new(4, 'Snots')
bad_cats2 = AngryCat.new(6, 'Claws')

# - - - - - - - - - - - - - - - - Question 4
# Given the class below, if we created a new instance of
#  the class and then called to_s on that instance we would get 
# something like "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end
# How could we go about changing the to_s output on this
#  method to look like this: I am a tabby cat? (this is assuming 
  # that "tabby" is the type we passed in during initialization).

# answer:  add both the attr_reader and the def to_s

class Cat
  attr_reader :type
  def initialize(type)
    @type = type
  end

  def to_s
    puts "#{type}"
  end
end

# - - - - - - - - - - - - - - - - Question 5
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
    puts 'lu'
  end 

  def model
    # method logic
    puts 'du'
  end
end
# What would happen if I called the methods like shown below?

# tv = Television.new
#  => #<Television:0x007f857911dd60> 
# tv.manufacturer
# NoMethodError: undefined method `manufacturer' for #<Television:0x007f857911dd6
# tv.model
# => du
# Television.manufacturer
# => lu
# Television.model
# 2.0.0-p647 :015 > Television.model
# NoMethodError: undefined method `model' for Television:Class


# - - - - - - - - - - - - - - - - Question 6
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
# In the make_one_year_older method we have used self.
# What is another way we could write this method 
# so we don't have to use the self prefix.

# answer:  instead of self.age just write @age += 1

# - - - - - - - - - - - - - - - - Question 7
# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color 
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

# answer:
# redundant return in the self.information def







