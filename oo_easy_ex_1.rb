# - - -- - - - - - - - Question 1

# Which of the following are objects in Ruby?
# If they are objects, how can you find out what class they belong to?

# true
# "hello"
# [1, 2, 3, "happy days"]
# 142

# answer:
# Everything is an object, just call .class on it to find out which one:
# true.class
#  => TrueClass
# "hello".class
#  => String
#  [1, 2, 3, "happy days"].class
#  => Array
#  142.class
#  => Fixnum


# - - - - - - - - - - - - - Question 2
# If we have a Car class and a Truck class and we want to be 
# able to go_fast, how can we add the ability for them to go_fast 
# using the module Speed. How can you check if your Car or Truck 
# can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end


# answer:  add include Speed to both Car and Truck classes

# - - - - - - - - - - - - - - Question 3

# In the last question we had a module called Speed which contained
#  a go_fast method. 
# We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class 
# (as shown below) you might have noticed that the string printed when
#  we go fast includes the 
# name of the type of vehicle we are using. How is this done?

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!

# answer:
# A new instance of the car class is created, named small_car.
# Then the go_slow method is called on small car

# launch school answer:
# We use self.class in the method and this works the following way:

# self refers to the object itself, in this case either a Car or 
#   Truck object.
# We ask self to tell us its class with .class. It tells us.
# We don't need to use to_s here because it is inside of a string 
# and is interpolated which means it will take care of the to_s for us.

# - - - - - - - - - - - - - - Question 4

# If we have a class AngryCat how do we create a new 
#   instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# answer:
AngryCat.new

# - - - - - - - - - - - - - - Question 5
# Which of these two classes has an instance variable and
#  how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# answer:
# Pizza has an instance variable in it, notated by the "@" symbol with @name

# -  - - - - - - - - - - - - - Question 6

# What could we add to the class below to access the 
# instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# answer:
# you can already access it directly

#  - - - - - - - - - - - - - - - Question 7

# What is the default thing that Ruby will print to the screen 
# if you call to_s on an object? 
# Where could you go to find out if you want to be sure?

# answer:  
# Launch School wording: By default if you call to_s you will be telling Ruby to print the object’s class and an encoding of the object id to the console.



# - - -  - - - - - - - - - Question 8

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
# You can see in the make_one_year_older method we have used self.
# What does self refer to here?

#answer: self is referencing the instance that called the method



# - - - - - - - - - - - - - Question 9

# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
# In the name of the cats_count method we have used self. 
# What does self refer to in this context?

# answer: it is calling Cat.cats_count

# - - - - - - - - - - - - - - Question 10

# If we have the class below, what would you need to call 
# to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# answer:  you need Bag.new('argument1', 'arugment2')










